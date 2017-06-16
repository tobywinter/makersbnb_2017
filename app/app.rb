ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'helpers'
require_relative 'app_controller'
require_relative 'controllers/user_controller'
require_relative 'controllers/space_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/booking_controller'

class MakersBnB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  use Rack::MethodOverride
  helpers Helpers

end
