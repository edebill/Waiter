class BiometricsController < ApplicationController
  # GET /biometrics
  # GET /biometrics.xml
  def index
    @biometrics = Biometric.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @biometrics }
    end
  end

  # GET /biometrics/1
  # GET /biometrics/1.xml
  def show
    @biometric = Biometric.find(params[:id])

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
    @biometric = Biometric.find(params[:id])
  end

  # POST /biometrics
  # POST /biometrics.xml
  def create
    @biometric = Biometric.new(params[:biometric])

    respond_to do |format|
      if @biometric.save
        format.html { redirect_to(root_url, :notice => 'Biometric data was successfully recorded.') }
        format.xml  { render :xml => @biometric, :status => :created, :location => @biometric }
      else
        format.html { render :controller => "home", :action => "index" }
        format.xml  { render :xml => @biometric.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /biometrics/1
  # PUT /biometrics/1.xml
  def update
    @biometric = Biometric.find(params[:id])

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
    @biometric = Biometric.find(params[:id])
    @biometric.destroy

    respond_to do |format|
      format.html { redirect_to(biometrics_url) }
      format.xml  { head :ok }
    end
  end
end
