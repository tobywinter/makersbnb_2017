class MakersBnB < Sinatra::Base

  get '/spaces' do
    current_user
    @spaces = Space.all
    erb :'spaces/index'
  end

  post '/spaces' do
    @space = Space.create(name: params[:name],
                          description: params[:description],
                          rate: params[:rate],
                          max_capacity: params[:max_capacity],
                          available_from_date: params[:available_from_date],
                          available_to_date: params[:available_to_date])

    redirect to '/spaces'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  get '/spaces/:id' do
    @space = Space.first(id: params[:id])
    # @space = space ? space.name : []
    erb :'spaces/space'
  end

  get '/spaces/:id/update' do
    space = Space.first(id: params[:id])
    erb :'spaces/update'
  end

end
