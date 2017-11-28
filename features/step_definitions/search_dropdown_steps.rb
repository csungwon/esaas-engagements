When /^I type in "([^\"]*)" into autocomplete list "([^\"]*)"$/ do |typed, input_name|
    page.execute_script %Q{$('#{input_name}').val('#{typed}').keydown()}
    fill_in("#{input_name}",:with => typed)
end

Then /^I should see "([^\"]*)" in the autocomplete list "([^\"]*)"$/ do |option, input_name|
    find('ul.ui-autocomplete').should have_content(option)
end

Then /^I should not see "([^\"]*)" in the autocomplete list "([^\"]*)"$/ do |option, input_name|
    find('ul.ui-autocomplete').should_not have_content(option)
end
