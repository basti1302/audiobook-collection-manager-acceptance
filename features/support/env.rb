require 'rspec/expectations'
require 'capybara/cucumber'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(
    app,
    window_size: [1280, 1024]#,
    #debug:       true
  )
end
#Capybara.default_driver = :selenium
Capybara.default_driver    = :poltergeist
Capybara.javascript_driver = :poltergeist
Capybara.default_selector = :css

World(RSpec::Matchers)
