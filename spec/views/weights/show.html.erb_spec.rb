require 'spec_helper'

describe "weights/show.html.erb" do
  before(:each) do
    assign(:weight, @weight = stub_model(Weight,
      :user_id => 1,
      :pounds => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
   rendered.should contain(1)
   rendered.should contain(1.5)
  end
end
