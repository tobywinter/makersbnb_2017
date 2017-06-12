ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base

get '/spaces' do
  erb :'spaces/index'
end

post '/spaces' do

end

get '/spaces/new' do
  erb :'spaces/new'
end

end
