When /^I fill in the fields as follows:$/ do |table|
#  print(page.body)
 table.hashes.each do |t|
   case t[:value]
#   when /^select date "(.*)"$/
#      steps %Q{When I select "#{$1}" as the "#{t[:field]}" date}
   when /^selected (.*)"$/
     steps %Q{When I select "#{$1}" from "#{t[:field]}"}
#   when /^(un)?checked$/
#      steps %Q{When I #{$1}check "#{t[:field]}"}
   else
     if "#{t[:field]}" == "Type of user"
       select "#{t[:value]}" , :from => "user[type_user]"
     else
       steps %Q{When I fill in "#{t[:field]}" with "#{t[:value]}"}
     end
   end
 end
end
    

Then /^I should see "(.*)" has type "(.*)"$/ do |username, type|
    find('tr', text: username.to_s).should have_content(type.to_s)
end

Then /^I should see "(.*)" has SID "(.*)"$/ do |username, sid|
    find('tr', text: username.to_s).should have_content(sid.to_s)
end

# Given(/^I press New User$/) do
#     pending
# end
