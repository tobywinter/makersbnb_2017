class MakersBnB < Sinatra::Base

  get '/spaces' do
    @spaces = Space.all
    p @spaces
    erb :'spaces/index'
  end

  post '/spaces' do
    @space = Space.create(name: params[:name],
                      description: params[:description],
                      rate: params[:rate],
                      max_capacity: params[:max_capacity],
                      available_from_date: params[:available_from_date],
                      available_to_date: params[:available_to_date])
    p @space

    redirect to '/spaces'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

end
