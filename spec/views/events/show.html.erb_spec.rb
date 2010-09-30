require 'spec_helper'

describe "events/show.html.erb" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :user_id => 1,
      :quantity => 1.5,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain(1.5.to_s)
    rendered.should contain("Description".to_s)
  end
end
