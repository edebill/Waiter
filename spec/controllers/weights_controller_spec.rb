require 'spec_helper'

describe WeightsController do

  def mock_weight(stubs={})
    @mock_weight ||= mock_model(Weight, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all weights as @weights" do
      Weight.stub(:all) { [mock_weight] }
      get :index
      assigns(:weights).should eq([mock_weight])
    end
  end

  describe "GET show" do
    it "assigns the requested weight as @weight" do
      Weight.stub(:find).with("37") { mock_weight }
      get :show, :id => "37"
      assigns(:weight).should be(mock_weight)
    end
  end

  describe "GET new" do
    it "assigns a new weight as @weight" do
      Weight.stub(:new) { mock_weight }
      get :new
      assigns(:weight).should be(mock_weight)
    end
  end

  describe "GET edit" do
    it "assigns the requested weight as @weight" do
      Weight.stub(:find).with("37") { mock_weight }
      get :edit, :id => "37"
      assigns(:weight).should be(mock_weight)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created weight as @weight" do
        Weight.stub(:new).with({'these' => 'params'}) { mock_weight(:save => true) }
        post :create, :weight => {'these' => 'params'}
        assigns(:weight).should be(mock_weight)
      end

      it "redirects to the created weight" do
        Weight.stub(:new) { mock_weight(:save => true) }
        post :create, :weight => {}
        response.should redirect_to(weight_url(mock_weight))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved weight as @weight" do
        Weight.stub(:new).with({'these' => 'params'}) { mock_weight(:save => false) }
        post :create, :weight => {'these' => 'params'}
        assigns(:weight).should be(mock_weight)
      end

      it "re-renders the 'new' template" do
        Weight.stub(:new) { mock_weight(:save => false) }
        post :create, :weight => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested weight" do
        Weight.should_receive(:find).with("37") { mock_weight }
        mock_weight.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :weight => {'these' => 'params'}
      end

      it "assigns the requested weight as @weight" do
        Weight.stub(:find) { mock_weight(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:weight).should be(mock_weight)
      end

      it "redirects to the weight" do
        Weight.stub(:find) { mock_weight(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(weight_url(mock_weight))
      end
    end

    describe "with invalid params" do
      it "assigns the weight as @weight" do
        Weight.stub(:find) { mock_weight(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:weight).should be(mock_weight)
      end

      it "re-renders the 'edit' template" do
        Weight.stub(:find) { mock_weight(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested weight" do
      Weight.should_receive(:find).with("37") { mock_weight }
      mock_weight.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the weights list" do
      Weight.stub(:find) { mock_weight(:destroy => true) }
      delete :destroy, :id => "1"
      response.should redirect_to(weights_url)
    end
  end

end
