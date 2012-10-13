Then /^I should see a twitter sign in button$/ do
  page.should have_content("Sign in with Twitter")
end

Given /^I am signed in with twitter$/ do
  visit "/auth/twitter"
end

When /^I visit the landing page$/ do
  visit "/"
end

Then /^I should be on the sites screen$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see "(.*?)" button$/ do |button_name|
  pending # express the regexp above with the code you wish you had
end

