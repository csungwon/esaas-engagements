Then /^I should see "(.*)" has type "(.*)"$/ do |username, type|
    #text = :type.choose("")
#   if page.respond_to? :should
#     page.should have_content(text)
#   else
#     assert page.has_content?(text)
#   end
    #find('h1', text: "Users")
    # find("#username")
    #page.find('fake name')
    #print page.find('h2').text
    #page.find_all('a', :text => "#username")
    #page.should have_content('fake name')
    #.should have_content("#{type}")
    print "HELLLO"
    #page.find('tr', :text => 'fake name')
    #.should have_content("#{type}")
    #find('form.foo .btn').click
end

Then /^I should see "(.*)" has SID "(.*)"$/ do |username, sid|
    #text = type.choose("")
#   if page.respond_to? :should
#     page.should have_content(text)
#   else
#     assert page.has_content?(text)
#   end
    find('tr', text: "#{username}").should have_content("#{sid}")
end

# Given(/^I press New User$/) do
#     pending
# end
