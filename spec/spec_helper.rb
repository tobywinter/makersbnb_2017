ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require './app/app'
require 'helpers/session'

Capybara.app = MakersBnB

ENV['RACK_ENV'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  ])

SimpleCov.start

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.include SessionHelpers

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
