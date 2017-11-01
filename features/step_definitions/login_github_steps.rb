When(/^I visit the auth path$/) do
  visit "/auth/:provider/callback(.:format)"
end

Given(/^I use provider github$/) do 
  visit "/auth/github"
end

Given(/^I am visiting the provider "([^"]*)"$/) do |arg1|
  visit "/#{arg1.downcase}"
end

Given(/^I want to go to orgs$/) do 
  visit "/orgs"
end