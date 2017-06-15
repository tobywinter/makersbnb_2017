class MakersBnB < Sinatra::Base

  get '/booking' do
    erb :'bookings/index'
  end

  get '/booking/new' do
    erb :'bookings/new'
  end

  post '/booking' do
    @booking = Booking.create(from_date: params[:request_from_date], to_date: params[:request_to_date])
    redirect to '/booking'
  end

end
