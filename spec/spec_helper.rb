require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require './app/app'

Capybara.app = MakersBnB

ENV['RACK_ENV'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  ])

SimpleCov.start

RSpec.configure do |config|

end
