# Given /^I am on the user information page for "(.*)"$/ do |username|
#     u = User.find_by_name(username)
#     visit user_path(u)
# end

# Then /^I should be on the user information page for "(.*)"$/ do |username|
#     u = User.find_by_name(username)
#     expect(visit user_path(u))
# end