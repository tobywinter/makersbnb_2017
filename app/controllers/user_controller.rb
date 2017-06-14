class MakersBnB < Sinatra::Base

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
