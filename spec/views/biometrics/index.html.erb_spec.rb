require 'spec_helper'

describe "biometrics/index.html.erb" do
  before(:each) do
    assign(:biometrics, [
      stub_model(Biometric,
        :weight => 1.5,
        :systolic => 1,
        :diastolic => 1,
        :bpm => 1,
        :user_id => 1
      ),
      stub_model(Biometric,
        :weight => 1.5,
        :systolic => 1,
        :diastolic => 1,
        :bpm => 1,
        :user_id => 1
      )
    ])
  end

  it "renders a list of biometrics" do
    render
    rendered.should have_selector("tr>td", :content => 1.5.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
