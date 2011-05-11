require 'spec_helper'

describe BiometricsController do

  before :each do
    @biometric = Factory.create(:biometric)
    @user = @biometric.user
    @user.confirm!
    sign_in @user
  end

  describe "GET index" do
    it "assigns all biometrics as @biometrics" do
      get :index
      assigns(:biometrics).should == [@biometric]
    end
  end

  describe "GET show" do
    it "assigns the requested biometric as @biometric" do
      get :show, :id => @biometric.id
      assigns(:biometric).should == @biometric
    end
  end

  describe "GET new" do
    it "assigns a new biometric as @biometric" do
      get :new
      assigns(:biometric)
    end
  end

  describe "GET edit" do
    it "assigns the requested biometric as @biometric" do
      get :edit, :id => @biometric.id
      assigns(:biometric).should == @biometric
    end
  end

  describe "POST create" do
    before :each do
      @biometric = Factory.build(:biometric, :user => @user)
      sign_in @user
    end
      

    describe "with valid params" do
      it "assigns a newly created biometric as @biometric" do
        post :create, :biometric => @biometric.attributes
        assigns(:biometric).weight.should == @biometric.weight
      end

      it "redirects to the created biometric" do
        post :create, :biometric => @biometric.attributes
        response.should redirect_to(root_url)
      end
    end

    describe "with invalid params" do
      it "sets the flash" do
        post :create, :biometric => @biometric.attributes
        response.should set_the_flash
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested biometric" do
        @biometric.weight += 1
        put :update, :id => @biometric.id, :biometric => @biometric.attributes
        Biometric.find(@biometric.id).weight.should == @biometric.weight
      end

      it "redirects to the root page" do
        put :update, :id => @biometric.id, :biometric => @biometric.attributes
        response.should redirect_to(biometric_url(@biometric))
      end
    end

    describe "with invalid params" do
      before :each do
        @biometric.weight = "a"
      end

      it "assigns the biometric as @biometric" do
        put :update, :id => @biometric.id, :biometric => @biometric.attributes
        assigns(:biometric)
      end

      it "sets the flash" do
        put :update, :id => @biometric.id, :biometric => @biometric.attributes
        response.should set_the_flash
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested biometric" do
      delete :destroy, :id => @biometric.id
      Biometric.where(:id => @biometric.id).count.should == 0
    end

    it "redirects to the biometrics list" do
      delete :destroy, :id => @biometric.id
      response.should redirect_to(biometrics_url)
    end
  end

end
