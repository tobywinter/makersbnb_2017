require 'sinatra/base'

class MakersBnB < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/index'
  end

  post '/users' do
    redirect '/'
  end

end
