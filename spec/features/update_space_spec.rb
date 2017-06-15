feature 'update space' do
  scenario 'host want to update the current space' do

    visit('/spaces/new')
    fill_in('name', with: 'One')
    enter_generic_details

    within 'ul#spaces' do
      expect(page).to have_content('One')
    end
    visit('/spaces/new')
    fill_in('name', with: 'Two')
    enter_generic_details

    within 'ul#spaces' do
      expect(page).to have_content('One')
      expect(page).to have_content('Two')
    end

    first(:link, 'See Space').click
      
    expect(current_path).to eq('/spaces/4')
    expect(page).to have_content('One')
      
    click_button('Edit Space')
    expect(current_path).to eq('/spaces/4/update')
    
    fill_in('description', with: 'Shoe Box')
    fill_in('rate', with: 100)  
      
    click_button('Update my Space')
    expect(current_path).to eq('/spaces/4')
    expect(page).to have_content('Shoe Box')
      
  end
end
