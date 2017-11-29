Given /^the following images exist:$/ do |table|
end

Then /^I should find an image with alternate text "(.*)"$/ do |alt_text|
	expect(page).to have_css("image[alt='#{alt_text}']")
end