feature 'update space' do
  scenario 'host want to update a space' do
      
    visit('/spaces/new')
    fill_in('name', with: 'One')
    fill_in('description', with: 'Lovely little studio to swing a cat')
    fill_in('rate', with: 90)
    fill_in('max_capacity', with: 3)
    fill_in('available_from_date', with: '01/07/2017')
    fill_in('available_to_date', with: '03/07/2017')
    click_button('List my Space')
    expect(current_path).to eq('/spaces')
      
    within 'ul#spaces' do
      expect(page).to have_content('One')
    end
      
    find_button('Update Space').click 
    expect(current_path).to eq('/spaces/1')
      
    fill_in('name', with: 'Three')
    click_button('List my Space')
      
    within 'ul#spaces' do
      expect(page).to have_content('Three')
    end
      
      
      
  end
end

