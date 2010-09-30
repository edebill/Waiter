require 'spec_helper'

describe "events/edit.html.erb" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :new_record? => false,
      :user_id => 1,
      :quantity => 1.5,
      :description => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    rendered.should have_selector("form", :action => event_path(@event), :method => "post") do |form|
      form.should have_selector("input#event_user_id", :name => "event[user_id]")
      form.should have_selector("input#event_quantity", :name => "event[quantity]")
      form.should have_selector("input#event_description", :name => "event[description]")
    end
  end
end
