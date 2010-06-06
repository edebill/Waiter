require 'spec_helper'

describe "cardios/new.html.erb" do
  before(:each) do
    assign(:cardio, stub_model(Cardio,
      :new_record? => true,
      :user_id => 1,
      :systolic => 1,
      :diastolic => 1,
      :bpm => 1
    ))
  end

  it "renders new cardio form" do
    render

    rendered.should have_selector("form", :action => cardios_path, :method => "post") do |form|
      form.should have_selector("input#cardio_user_id", :name => "cardio[user_id]")
      form.should have_selector("input#cardio_systolic", :name => "cardio[systolic]")
      form.should have_selector("input#cardio_diastolic", :name => "cardio[diastolic]")
      form.should have_selector("input#cardio_bpm", :name => "cardio[bpm]")
    end
  end
end
