#encoding: utf-8

Given /^some audiobooks in the collection$/ do
  upload_fixtures backend_url('audiobooks'), $fixtures
end

When /^I visit the list of audiobooks$/ do
  visit ui_url '/index.html'
end

Then /^I see all audiobooks?$/ do
  page.should have_content 'Coraline'
  page.should have_content 'Man In The Dark'
  page.should have_content 'Siddhartha'
end
