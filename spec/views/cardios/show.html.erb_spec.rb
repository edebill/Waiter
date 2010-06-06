require 'spec_helper'

describe "cardios/show.html.erb" do
  before(:each) do
    assign(:cardio, @cardio = stub_model(Cardio,
      :user_id => 1,
      :systolic => 1,
      :diastolic => 1,
      :bpm => 1
    ))
  end

  it "renders attributes in <p>" do
    render
   rendered.should contain(1)
   rendered.should contain(1)
   rendered.should contain(1)
   rendered.should contain(1)
  end
end
