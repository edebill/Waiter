require 'spec_helper'

describe "events/new.html.erb" do
  before(:each) do
    assign(:event, stub_model(Event,
      :new_record? => true,
      :user_id => 1,
      :quantity => 1.5,
      :description => "MyString"
    ))
  end

  it "renders new event form" do
    render

    rendered.should have_selector("form", :action => events_path, :method => "post") do |form|
      form.should have_selector("input#event_user_id", :name => "event[user_id]")
      form.should have_selector("input#event_quantity", :name => "event[quantity]")
      form.should have_selector("input#event_description", :name => "event[description]")
    end
  end
end
