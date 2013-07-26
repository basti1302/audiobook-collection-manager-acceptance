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

When /^(?:I )?sort by "(.*?)"$/ do |sort_criterion|
  click_on sort_criterion
end

When /^select "(.*?)" from the menu$/ do |option|
  click_link option
end

When /^click on "(.*?)"$/ do |link|
  click_link link
end

When /^click the button to add a new audiobook$/ do
  click_link 'Add Audiobook'
end

When /^I hack in a new audiobook$/ do
  fill_in('title', :with => 'Cucumber for Dummies')
  fill_in('author_first_name', :with => 'Au')
  fill_in('author_last_name', :with => 'Thor')
  fill_in('voice_artist_first_name', :with => 'Voice')
  fill_in('voice_artist_last_name', :with => 'Artist')
  fill_in('description', :with => 'This is a lengthy, boring description about the audiobook.')
end

When /^save it$/ do
  click_button 'create'
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

Then /^(?:I see )?"(.*?)" listed (first|second|third)$/ do |title, position|
  row = {'first' => '1', 'second' => '2', 'third' => '3'}[position]
  within_table 'list_audiobooks' do
    within(:xpath, ".//tbody/tr[#{row}]") do
      page.should have_content title
    end
  end
end

Then /^I see the form for adding a new audiobook$/ do
  page.find('h1').should have_content 'Add a New Audiobook'
end

Then /^I see the new audiobook in the list of audiobooks$/ do
  # somehow, when running on PhantomJS the backend POST call to create the new
  # audiobook takes effect only *after* the frontend redirect to /audiobooks
  # has taken place. When using a real browser, this problem does not occur
  # (probably because PhantomJS is faster than a real browser).
  # Note: wait_until or even sleep won't help here because AngularJS has already
  # executed the request to /audiobooks. It won't fetch the collection from the
  # backend again by itself.
  # Ugly hack: After creating the audiobook, we just do a full page reload. :-(
  visit ui_url '/index.html'
  page.should have_content('Cucumber for Dummies')
  page.should have_content('Thor, Au')
end

Then /^I see the details page for "(.*?)"$/ do |audiobook_title|
  page.find('h1').should(have_content('Coraline'))
end
