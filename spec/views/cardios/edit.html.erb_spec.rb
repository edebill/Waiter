require 'spec_helper'

describe "cardios/edit.html.erb" do
  before(:each) do
    assign(:cardio, @cardio = stub_model(Cardio,
      :new_record? => false,
      :user_id => 1,
      :systolic => 1,
      :diastolic => 1,
      :bpm => 1
    ))
  end

  it "renders the edit cardio form" do
    render

    rendered.should have_selector("form", :action => cardio_path(@cardio), :method => "post") do |form|
      form.should have_selector("input#cardio_user_id", :name => "cardio[user_id]")
      form.should have_selector("input#cardio_systolic", :name => "cardio[systolic]")
      form.should have_selector("input#cardio_diastolic", :name => "cardio[diastolic]")
      form.should have_selector("input#cardio_bpm", :name => "cardio[bpm]")
    end
  end
end
