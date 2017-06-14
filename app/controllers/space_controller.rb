class MakersBnB < Sinatra::Base

  get '/spaces' do
    @spaces = Space.all
    erb :'/spaces/index'
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
    erb :'/spaces/new'
  end

  get '/spaces/:id' do
    @space = Space.first(id: params[:id])
    session[:id] = params[:id]
    erb :'/spaces/space'
  end
  
  get '/spaces/:id/update' do
    @space = Space.get(session[:id])
     p __LINE__, @space
    erb :'/spaces/update'
  end

  post '/spaces/:id/update' do
    session[:name] = params[:name]
    session[:description] = params[:description]
    session[:rate] = params[:rate]
    session[:max_capacity] = params[:max_capacity]
    session[:available_from_date] = params[:available_from_date]
    session[:available_to_date] = params[:available_to_date]

    @id = session[:id].to_i
        p __LINE__, session, @id
    @space = Space.get(@id)
    @space.update(:name => session[:name],
                          :description => session[:description],
                          :rate => session[:rate],
                          :max_capacity => session[:max_capacity],
                          :available_from_date => session[:available_from_date],
                          :available_to_date => session[:available_to_date])
    p __LINE__, @space
    @space.save
    redirect to "/spaces/#{@id}"
  end

end
