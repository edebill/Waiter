require 'spec_helper'

describe EventsController do

  before :each do
    @event = Factory.create(:event)
    @user = @event.user
    @user.confirm!
    sign_in @user
  end
  describe "GET index" do
    it "assigns all events as @events" do
      get :index
      assigns(:events).should == [@event]
    end
  end

  describe "GET show" do
    it "assigns the requested event as @event" do
      get :show, :id => @event.id
      assigns(:event).should == @event
    end
  end

  describe "GET new" do
    it "assigns a new event as @event" do
      get :new
      assigns(:event)
    end
  end

  describe "GET edit" do
    it "assigns the requested event as @event" do
      get :edit, :id => @event.id
      assigns(:event).should == @event
    end
  end

  describe "POST create" do
    before :each do
      @event = Factory.build(:event, :user => @user)
      sign_in @user
    end

    describe "with valid params" do
      it "assigns a newly created event as @event" do
        post :create, :event => @event.attributes
        assigns(:event).quantity.should == @event.quantity
      end

      it "redirects to the created event" do
        post :create, :event => @event.attributes
        response.should redirect_to(root_url)
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested event" do
        @event.quantity += 1
        put :update, :id => @event.id, :event => @event.attributes
        Event.find(@event.id).quantity.should == @event.quantity
      end

      it "redirects to the root page" do
        put :update, :id => @event.id, :event => @event.attributes
        response.should redirect_to(event_url(@event))
      end
    end

    describe "with invalid params" do
      before :each do
        @event.quantity = "a"
      end

      it "assigns the event as @event" do
        put :update, :id => @event.id, :event => @event.attributes
        assigns(:event)
      end

    end

  end

  describe "DELETE destroy" do
    it "destroys the requested event" do
      delete :destroy, :id => @event.id
      Event.where(:id => @event.id).count.should == 0
    end

    it "redirects to the events list" do
      delete :destroy, :id => @event.id
      response.should redirect_to(root_url)
    end
  end

end
