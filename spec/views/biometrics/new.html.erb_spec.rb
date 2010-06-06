require 'spec_helper'

describe "biometrics/new.html.erb" do
  before(:each) do
    assign(:biometric, stub_model(Biometric,
      :new_record? => true,
      :weight => 1.5,
      :systolic => 1,
      :diastolic => 1,
      :bpm => 1,
      :user_id => 1
    ))
  end

  it "renders new biometric form" do
    render

    rendered.should have_selector("form", :action => biometrics_path, :method => "post") do |form|
      form.should have_selector("input#biometric_weight", :name => "biometric[weight]")
      form.should have_selector("input#biometric_systolic", :name => "biometric[systolic]")
      form.should have_selector("input#biometric_diastolic", :name => "biometric[diastolic]")
      form.should have_selector("input#biometric_bpm", :name => "biometric[bpm]")
      form.should have_selector("input#biometric_user_id", :name => "biometric[user_id]")
    end
  end
end
