require 'rspec/expectations'
require 'capybara/cucumber'
require 'capybara/poltergeist'

if ENV['IN_BROWSER']
  # On demand: non-headless tests via Selenium/WebDriver
  # To run the scenarios in browser (default: Firefox), use the following command line:
  # RUN_IN_BROWSER=true bundle exec cucumber
  # or (to have a pause of 1 second between each step):
  # RUN_IN_BROWSER=true PAUSE=1 bundle exec cucumber
  Capybara.default_driver = :selenium
  AfterStep do
    sleep (ENV['PAUSE'] || 0).to_i
  end
else
  # DEFAULT: headless tests with poltergeist/PhantomJS
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(
      app,
      window_size: [1280, 1024]#,
      #debug:       true
    )
  end
  Capybara.default_driver    = :poltergeist
  Capybara.javascript_driver = :poltergeist
end

Capybara.default_selector = :css
World(RSpec::Matchers)

# configure the base urls for frontend and backend here
$audiobook_collection_manager_ui_base_url = 'http://localhost:8000/app/'
$storra_rest_server_base_url              = 'http://localhost:1302/'

def ui_url(path)
  $audiobook_collection_manager_ui_base_url + path
end

def backend_url(path)
  $storra_rest_server_base_url + path
end

# file with database fixtures
$fixtures = 'features/support/fixtures.json'
