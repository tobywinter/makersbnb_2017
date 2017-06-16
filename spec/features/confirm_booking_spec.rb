feature 'Confirm Booking' do
  before(:each) do
    @owner = User.create(email: 'owner@test.com',
    password: 'password',
    password_confirmation: 'password')
    @booker = User.create(email: 'booker@test.com',
    password: 'password',
    password_confirmation: 'password')
    space = Space.create(name: "Wonderland",
                          description: "Your Body",
                          rate: "1",
                          max_capacity: "2",
                          available_from_date: "25/2/1988",
                          available_to_date: "2/5/2017",
                          user_id: @owner.id )
  end

  scenario 'User(Booker) can view their requested bookings' do
    sign_in(email: @booker.email, password: @booker.password)
    create_booking
    visit ('/booking/pending')
    expect(page).to have_content ('Wonderland')
    expect(page).to have_content  ('Booking: Unconfirmed')
  end

  scenario 'User(Owner) can view and confirm their requested bookings' do
    sign_in(email: @booker.email, password: @booker.password)
    create_booking
    sign_out
    sign_in(email: @owner.email, password: @owner.password)
    visit ('/booking/confirm')
    expect(page).to have_content ('Wonderland')
    expect(page).to have_content ('Booking: Unconfirmed')
    click_button('Confirm')
    expect(page).to have_content ('Booking: Confirmed')
  end

  # scenario 'User(Owner) can view their requested bookings' do
  #   sign_up
  #   sign_in
  #   visit ('/booking/confirm')
  #   expect(page).to have_content ('Wonderland')
  #   expect(page).to have_content ('Booking: Unconfirmed')
  #   click_button('Confirm')
  #   expect(page).to have_content ('Booking: Confirmed')
  # end
end
