require 'spec_helper'

describe "cardios/index.html.erb" do
  before(:each) do
    assign(:cardios, [
      stub_model(Cardio,
        :user_id => 1,
        :systolic => 1,
        :diastolic => 1,
        :bpm => 1
      ),
      stub_model(Cardio,
        :user_id => 1,
        :systolic => 1,
        :diastolic => 1,
        :bpm => 1
      )
    ])
  end

  it "renders a list of cardios" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
