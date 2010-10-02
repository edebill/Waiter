require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))


Given /^I am logged in as "([^\"]*)"$/ do |email|
  Given %|I am on the homepage|
  When %|I follow "Sign In"|
  When %|I fill in "Email" with "#{email}"|
  When %|I fill in "Password" with "password"|
  When %|I press "Sign in"|
  Then %|I should see "Signed in as"|
end

