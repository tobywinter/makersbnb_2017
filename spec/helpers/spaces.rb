module SpaceHelpers

  def create_space(name: 'One', available_from_date: '01/07/2017', available_to_date: '03/07/2017')
    fill_in('name', with: name)
    fill_in('description', with: 'Lovely little studio to swing a cat')
    fill_in('rate', with: 90)
    fill_in('max_capacity', with: 3)
    fill_in('available_from_date', with: available_from_date)
    fill_in('available_to_date', with: available_to_date)
    click_button('List my Space')
    expect(current_path).to eq('/spaces')
  end
end
