ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require './app/app'

Capybara.app = MakersBnB
