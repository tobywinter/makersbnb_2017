ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require './app/app'

require 'helpers/spaces'

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
  # Everything in this block runs once before each individual test
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.include SpaceHelpers
  # Everything in this block runs once after each individual test
  config.after(:each) do
    DatabaseCleaner.clean
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
  config.include Capybara::DSL # good

end
