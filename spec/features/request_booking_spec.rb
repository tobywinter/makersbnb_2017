feature 'Requesting booking' do
  before(:each) do
    owner = User.create(email: 'owner@test.com',
    password: 'password',
    password_confirmation: 'password')
    booker = User.create(email: 'booker@test.com',
    password: 'password',
    password_confirmation: 'password')
    space = Space.create(name: "Wonderland",
                          description: "Your Body",
                          rate: "1",
                          max_capacity: "2",
                          available_from_date: "25/2/1988",
                          available_to_date: "2/5/2017",
                          user_id: owner.id )
  end

  scenario 'as a user' do
    sign_up
    sign_in
    first(:link, 'See Space').click
    click_button('Request to hire')
    expect(current_path).to eq ('/booking/new')
    expect(page).to have_content('Request From')
    fill_in('request_from_date', with: '2/4/2017')
    fill_in('request_to_date', with: '10/4/2017')
    click_button('Submit request')
    expect(current_path).to eq ('/booking')
    expect(page).to have_content('Thank you! Your request will be reviewed by the host!')
    expect(Booking.count).to eq(1)
  end

end
