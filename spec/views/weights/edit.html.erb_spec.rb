require 'spec_helper'

describe "weights/edit.html.erb" do
  before(:each) do
    assign(:weight, @weight = stub_model(Weight,
      :new_record? => false,
      :user_id => 1,
      :pounds => 1.5
    ))
  end

  it "renders the edit weight form" do
    render

    rendered.should have_selector("form", :action => weight_path(@weight), :method => "post") do |form|
      form.should have_selector("input#weight_user_id", :name => "weight[user_id]")
      form.should have_selector("input#weight_pounds", :name => "weight[pounds]")
    end
  end
end
