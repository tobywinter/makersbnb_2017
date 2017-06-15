class MakersBnB < Sinatra::Base

  get '/booking' do
    erb :'bookings/index'
  end

  get '/booking/new' do
    erb :'bookings/new'
  end

  post '/booking' do
    # Booking.create(request_from_date: params[request_from_date], request_to_date: params[request_to_date])
    redirect to '/booking'
  end

end
