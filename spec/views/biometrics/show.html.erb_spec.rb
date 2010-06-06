require 'spec_helper'

describe "biometrics/show.html.erb" do
  before(:each) do
    assign(:biometric, @biometric = stub_model(Biometric,
      :weight => 1.5,
      :systolic => 1,
      :diastolic => 1,
      :bpm => 1,
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
   rendered.should contain(1.5)
   rendered.should contain(1)
   rendered.should contain(1)
   rendered.should contain(1)
   rendered.should contain(1)
  end
end
