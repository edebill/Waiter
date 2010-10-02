require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Then /^I should get an? ([^ ]*) containing "([^"]*)"$/ do |type, string|
  find(:css, ".#{type}").should have_content(string)
end



