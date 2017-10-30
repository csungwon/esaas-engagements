When(/^I visit the auth path$/) do
  visit "/auth/:provider/callback(.:format)"
end

Given(/^I use provider github$/) do 
  visit "/auth/github"
end

Given(/^I am signed in with provider "([^"]*)"$/) do |arg1|
  visit "/auth/github/callback"
end
