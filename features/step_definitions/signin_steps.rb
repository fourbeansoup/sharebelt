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
  page.should have_content("Your sites")
end

Then /^I should see "(.*?)" button$/ do |button_name|
  page.should have_link(button_name)
end

