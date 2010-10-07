require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Then /^I should get an? ([^ ]*) containing "([^"]*)"$/ do |type, string|   #"

# TODO:  make sure it's within a tag of class type
  page.should have_content(string)
end



