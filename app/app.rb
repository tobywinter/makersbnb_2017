ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'app_controller'
require_relative 'controllers/space_controller'


class MakersBnB < Sinatra::Base
  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    current_user
    erb :index
  end

  get '/users/new' do
    erb :'users/index'
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    end
  end

end
