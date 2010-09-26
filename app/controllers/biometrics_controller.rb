class BiometricsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :handle_now, :only => [ :create, :update]

  # GET /biometrics
  # GET /biometrics.xml
  def index
    @biometrics = current_user.biometrics

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @biometrics }
    end
  end

  # GET /biometrics/all.json
  # GET /biometrics/all.csv
  def all
    @biometrics = Biometric.select("systolic, diastolic, bpm, weight, record_date").where(:user_id => current_user.id).order(:record_date)

    respond_to do |format|
      format.xml  { render :xml => @biometrics }
      format.csv  { 
        csv = @biometrics.collect { |b| [b.record_date, b.weight, b.systolic, b.diastolic, b.bpm].to_csv }
        csv.unshift ["record date","weight","systolic","diastolic","bpm"].to_csv

        render :content_type => 'text/csv', :text =>  csv.join("")
      }
    end
  end


  # GET /biometrics/weight.json
  # GET /biometrics/weight.csv
  def weight
    @biometrics = Biometric.select("weight, record_date").where(:user_id => current_user.id).order(:record_date)

    respond_to do |format|
      format.json { render :json => @biometrics.collect { |b| [b.record_date.to_i * 1000, b.weight] } }
      format.xml  { render :xml => @biometrics }
      format.csv  { 
        csv = @biometrics.collect { |b| [b.record_date, b.weight].to_csv }
        render :content_type => 'text/csv', :text => csv.join("")
      }
    end
  end


  # GET /biometrics/1
  # GET /biometrics/1.xml
  def show
    Rails.logger.debug("current_user.id = #{current_user.id}")
    @biometric = Biometric.where(:user_id => current_user.id,
                                 :id => params[:id]).first

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @biometric }
    end
  end

  # GET /biometrics/new
  # GET /biometrics/new.xml
  def new
    @biometric = Biometric.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @biometric }
    end
  end

  # GET /biometrics/1/edit
  def edit

    @biometric = Biometric.where(:user_id => current_user.id,
                                 :id => params[:id]).first
  end

  # POST /biometrics
  # POST /biometrics.xml
  def create

    @biometric = current_user.biometrics.build(params[:biometric])

    respond_to do |format|
      if @biometric.save
        format.html { redirect_to(root_url, :notice => 'Biometric data was successfully recorded.') }
        format.xml  { render :xml => @biometric, :status => :created, :location => @biometric }
      else
        format.html {
          @biometrics = Biometric.where(:user_id => current_user.id).order('record_date asc')
          logger.debug(@biometric.errors.full_messages)
          flash[:alert] = @biometric.errors.full_messages
          render :template => "home/index"
        }
        format.xml  { render :xml => @biometric.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /biometrics/1
  # PUT /biometrics/1.xml
  def update

    @biometric = Biometric.where(:user_id => current_user.id,
                                 :id => params[:id]).first

    params[:biometric].delete(:user_id)   # make sure they don't change this
    respond_to do |format|
      if @biometric.update_attributes(params[:biometric])
        format.html { redirect_to(@biometric, :notice => 'Biometric was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @biometric.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /biometrics/1
  # DELETE /biometrics/1.xml
  def destroy
    @biometric = Biometric.where(:user_id => current_user.id,
                                 :id => params[:id]).first
    @biometric.destroy

    respond_to do |format|
      format.html { redirect_to(biometrics_url) }
      format.xml  { head :ok }
    end
  end


  protected

  def handle_now
    if params[:biometric][:record_date] == "now"
      params[:biometric][:record_date] = Time.now
    end
  end

end
