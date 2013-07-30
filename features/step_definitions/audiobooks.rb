#encoding: utf-8

Given /^some audiobooks in the collection$/ do
  upload_fixtures backend_url('audiobooks'), $fixtures
end

When /^I visit the list of audiobooks$/ do
  visit ui_url '/index.html'
end

When /^I search for "(.*?)"$/ do |search_term|
  fill_in('filter', :with => search_term)
  @matching_titles = ['Coraline']
  @not_matching_titles = ['Man In The Dark', 'Siddharta']
end

When /^I remove the filter$/ do
  # funny, '' (empty string) does not work?
  fill_in('filter', :with => ' ')
  @matching_titles = @not_matching_titles = nil
end

Then /^I see all audiobooks(?: again)?$/ do
  page.should have_content 'Coraline'
  page.should have_content 'Man In The Dark'
  page.should have_content 'Siddhartha'
end

Then /^I only see titles matching the search term$/ do
  @matching_titles.each do |title|
    page.should have_content title
  end

  @not_matching_titles.each do |title|
    page.should have_no_content title
  end
end


