require 'spec_helper'

describe "weights/new.html.erb" do
  before(:each) do
    assign(:weight, stub_model(Weight,
      :new_record? => true,
      :user_id => 1,
      :pounds => 1.5
    ))
  end

  it "renders new weight form" do
    render

    rendered.should have_selector("form", :action => weights_path, :method => "post") do |form|
      form.should have_selector("input#weight_user_id", :name => "weight[user_id]")
      form.should have_selector("input#weight_pounds", :name => "weight[pounds]")
    end
  end
end
