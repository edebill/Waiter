require 'spec_helper'

describe "weights/index.html.erb" do
  before(:each) do
    assign(:weights, [
      stub_model(Weight,
        :user_id => 1,
        :pounds => 1.5
      ),
      stub_model(Weight,
        :user_id => 1,
        :pounds => 1.5
      )
    ])
  end

  it "renders a list of weights" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.5.to_s, :count => 2)
  end
end
