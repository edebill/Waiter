require 'spec_helper'

describe CardiosController do

  def mock_cardio(stubs={})
    @mock_cardio ||= mock_model(Cardio, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all cardios as @cardios" do
      Cardio.stub(:all) { [mock_cardio] }
      get :index
      assigns(:cardios).should eq([mock_cardio])
    end
  end

  describe "GET show" do
    it "assigns the requested cardio as @cardio" do
      Cardio.stub(:find).with("37") { mock_cardio }
      get :show, :id => "37"
      assigns(:cardio).should be(mock_cardio)
    end
  end

  describe "GET new" do
    it "assigns a new cardio as @cardio" do
      Cardio.stub(:new) { mock_cardio }
      get :new
      assigns(:cardio).should be(mock_cardio)
    end
  end

  describe "GET edit" do
    it "assigns the requested cardio as @cardio" do
      Cardio.stub(:find).with("37") { mock_cardio }
      get :edit, :id => "37"
      assigns(:cardio).should be(mock_cardio)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created cardio as @cardio" do
        Cardio.stub(:new).with({'these' => 'params'}) { mock_cardio(:save => true) }
        post :create, :cardio => {'these' => 'params'}
        assigns(:cardio).should be(mock_cardio)
      end

      it "redirects to the created cardio" do
        Cardio.stub(:new) { mock_cardio(:save => true) }
        post :create, :cardio => {}
        response.should redirect_to(cardio_url(mock_cardio))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cardio as @cardio" do
        Cardio.stub(:new).with({'these' => 'params'}) { mock_cardio(:save => false) }
        post :create, :cardio => {'these' => 'params'}
        assigns(:cardio).should be(mock_cardio)
      end

      it "re-renders the 'new' template" do
        Cardio.stub(:new) { mock_cardio(:save => false) }
        post :create, :cardio => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested cardio" do
        Cardio.should_receive(:find).with("37") { mock_cardio }
        mock_cardio.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cardio => {'these' => 'params'}
      end

      it "assigns the requested cardio as @cardio" do
        Cardio.stub(:find) { mock_cardio(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:cardio).should be(mock_cardio)
      end

      it "redirects to the cardio" do
        Cardio.stub(:find) { mock_cardio(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(cardio_url(mock_cardio))
      end
    end

    describe "with invalid params" do
      it "assigns the cardio as @cardio" do
        Cardio.stub(:find) { mock_cardio(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:cardio).should be(mock_cardio)
      end

      it "re-renders the 'edit' template" do
        Cardio.stub(:find) { mock_cardio(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested cardio" do
      Cardio.should_receive(:find).with("37") { mock_cardio }
      mock_cardio.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the cardios list" do
      Cardio.stub(:find) { mock_cardio(:destroy => true) }
      delete :destroy, :id => "1"
      response.should redirect_to(cardios_url)
    end
  end

end
