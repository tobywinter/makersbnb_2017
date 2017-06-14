ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'

require_relative 'app_controller'
require_relative 'controllers/user_controller'
require_relative 'controllers/space_controller'


class MakersBnB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
