ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'

require_relative 'app_controller'
require_relative 'controllers/space_controller'


class MakersBnB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

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
    @user = User.new
    erb :'users/index'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/index'
    end
  end

end
