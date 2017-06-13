feature 'list multiple spaces' do
  scenario 'host want to list new spaces' do
      
    visit('/spaces/new')
    fill_in('name', with: 'One')
    fill_in('description', with: 'Lovely little studio to swing a cat')
    fill_in('rate', with: 90)
    fill_in('max_capacity', with: 3)
    fill_in('available_from_date', with: '01/07/2017')
    fill_in('available_to_date', with: '03/07/2017')
    click_button('List my Space')
    expect(current_path).to eq('/spaces')

    visit('/spaces/new')
    fill_in('name', with: 'Two')
    fill_in('description', with: 'Very large room with front garden')
    fill_in('rate', with: 150)
    fill_in('max_capacity', with: 6)
    fill_in('available_from_date', with: '01/07/2017')
    fill_in('available_to_date', with: '08/07/2017')
    click_button('List my Space')
    expect(current_path).to eq('/spaces')
      
    within 'ul#spaces' do
      expect(page).to have_content('One')
      expect(page).to have_content('Two')
    end
  end
    
    
    
end
