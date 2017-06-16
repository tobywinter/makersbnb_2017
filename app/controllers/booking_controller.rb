class MakersBnB < Sinatra::Base

  get '/booking' do
    erb :'bookings/index'
  end

  get '/booking/new' do
    erb :'bookings/new'
  end

  post '/booking' do
    booking = Booking.create(from_date: params[:request_from_date], to_date: params[:request_to_date],
    space_id: session[:id],
    user_id: session[:user_id])
    session[:booking_id] = booking.id
    redirect to '/booking'
  end

  get '/booking/pending' do
    @booking = Booking.first(id: session[:booking_id])
    @space =  Space.first(id: session[:id])
    erb :'bookings/pending'
  end

  get '/booking/confirm' do
    @booking = Booking.first(id: session[:booking_id])
    @space =  Space.first(id: session[:id])
    current_user
    erb :'bookings/pending'
  end

  post '/booking/confirm' do
    @booking = Booking.first(id: session[:booking_id])
    @booking.update(hired: true)
    flash.keep[:notice] = 'Booking confirmed!'
    redirect to 'booking/confirm'
  end

end
