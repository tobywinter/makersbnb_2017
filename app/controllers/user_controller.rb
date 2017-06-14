class MakersBnB < Sinatra::Base

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