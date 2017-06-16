module BookingHelpers

  def create_booking
    sign_up
    sign_in
    first(:link, 'See Space').click
    click_button('Request to hire')
    fill_in('request_from_date', with: '2/4/2017')
    fill_in('request_to_date', with: '10/4/2017')
    click_button('Submit request')
  end
end
