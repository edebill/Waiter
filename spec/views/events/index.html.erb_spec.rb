require 'spec_helper'

describe "events/index.html.erb" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :user_id => 1,
        :quantity => 1.5,
        :description => "Description"
      ),
      stub_model(Event,
        :user_id => 1,
        :quantity => 1.5,
        :description => "Description"
      )
    ])
  end

  it "renders a list of events" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.5.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Description".to_s, :count => 2)
  end
end
