require 'spec_helper'

describe BiometricsController do

  def mock_biometric(stubs={})
    @mock_biometric ||= mock_model(Biometric, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all biometrics as @biometrics" do
      Biometric.stub(:all) { [mock_biometric] }
      get :index
      assigns(:biometrics).should eq([mock_biometric])
    end
  end

  describe "GET show" do
    it "assigns the requested biometric as @biometric" do
      Biometric.stub(:find).with("37") { mock_biometric }
      get :show, :id => "37"
      assigns(:biometric).should be(mock_biometric)
    end
  end

  describe "GET new" do
    it "assigns a new biometric as @biometric" do
      Biometric.stub(:new) { mock_biometric }
      get :new
      assigns(:biometric).should be(mock_biometric)
    end
  end

  describe "GET edit" do
    it "assigns the requested biometric as @biometric" do
      Biometric.stub(:find).with("37") { mock_biometric }
      get :edit, :id => "37"
      assigns(:biometric).should be(mock_biometric)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created biometric as @biometric" do
        Biometric.stub(:new).with({'these' => 'params'}) { mock_biometric(:save => true) }
        post :create, :biometric => {'these' => 'params'}
        assigns(:biometric).should be(mock_biometric)
      end

      it "redirects to the created biometric" do
        Biometric.stub(:new) { mock_biometric(:save => true) }
        post :create, :biometric => {}
        response.should redirect_to(biometric_url(mock_biometric))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved biometric as @biometric" do
        Biometric.stub(:new).with({'these' => 'params'}) { mock_biometric(:save => false) }
        post :create, :biometric => {'these' => 'params'}
        assigns(:biometric).should be(mock_biometric)
      end

      it "re-renders the 'new' template" do
        Biometric.stub(:new) { mock_biometric(:save => false) }
        post :create, :biometric => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested biometric" do
        Biometric.should_receive(:find).with("37") { mock_biometric }
        mock_biometric.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :biometric => {'these' => 'params'}
      end

      it "assigns the requested biometric as @biometric" do
        Biometric.stub(:find) { mock_biometric(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:biometric).should be(mock_biometric)
      end

      it "redirects to the biometric" do
        Biometric.stub(:find) { mock_biometric(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(biometric_url(mock_biometric))
      end
    end

    describe "with invalid params" do
      it "assigns the biometric as @biometric" do
        Biometric.stub(:find) { mock_biometric(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:biometric).should be(mock_biometric)
      end

      it "re-renders the 'edit' template" do
        Biometric.stub(:find) { mock_biometric(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested biometric" do
      Biometric.should_receive(:find).with("37") { mock_biometric }
      mock_biometric.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the biometrics list" do
      Biometric.stub(:find) { mock_biometric(:destroy => true) }
      delete :destroy, :id => "1"
      response.should redirect_to(biometrics_url)
    end
  end

end
