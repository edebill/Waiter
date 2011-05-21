class EventsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :handle_now, :only => [ :create, :update]

  include ApplicationHelper

  # GET /events
  # GET /events.xml
  def index
    @events = Event.all
#current_user.events

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/all.json
  # GET /events/all.csv
  def all
    @events = Event.select("event_date, quantity, description").where(:user_id => current_user.id).order(:event_date)

    respond_to do |format|
      format.xml  { render :xml => @events }
      format.csv  { 
        csv = @events.collect { |e| [e.event_date, e.quantity, e.description].to_csv }
        csv.unshift ["event date", "quantity", "description"].to_csv

        render :content_type => 'text/csv', :text =>  csv.join("")
      }
    end
  end




  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.where(:user_id => current_user.id, :id => params[:id]).first

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
      format.json { render :json => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
      format.json { render :json => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.where(:user_id => current_user.id, :id => params[:id]).first
  end

  # POST /events
  # POST /events.xml
  def create
    @event = current_user.events.build(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to(root_url, :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
        format.json { 
          response = @event.attributes
          response["display_time"] = pretty_time @event.event_date

          render :json => {"event" => response }.to_json, :status => :created, :location => @event 
        }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
        format.json { render :json => @event }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.where(:user_id => current_user.id, :id => params[:id]).first
    @event.destroy

    respond_to do |format|
      format.html {
        flash[:info] = 'Event deleted'
        redirect_to(root_url)
      }
      format.xml  { head :ok }
    end
  end

  protected

  def handle_now
    if params[:event][:event_date] == "now"
      params[:event][:event_date] = Time.now
    end
  end


end
