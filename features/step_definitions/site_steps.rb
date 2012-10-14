When /^I go to add a new site$/ do
  click_link "Add a site"
end

When /^input valid site information$/ do
  fill_in 'Site Url', :with => "www.test.com"
  click_button "Save"
end

Then /^I should see "(.*?)" in my list of sites$/ do |site|
  page.should have_content(site)
end

Given /^a site "(.*?)" exists for another user$/ do |url|
  user = User.create
  user.sites.create(name: url)
end

When /^I go to the sites page$/ do
  visit "/sites"
end

Then /^I should not see "(.*?)" in my list of sites$/ do |url|
  page.should_not have_content(url)
end

