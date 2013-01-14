require 'rspec/expectations'
require 'capybara/cucumber'
require 'capybara/poltergeist'

if ENV['RUN_IN_BROWSER']
  # To run tests in browser:
  # RUN_IN_BROWSER=true cucumber
  # or 
  # RUN_IN_BROWSER=true PAUSE=1 cucumber
  # (to have a pause of 1 seconds between each step)
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
