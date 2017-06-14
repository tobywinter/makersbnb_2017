feature 'update space' do
  scenario 'host want to update a space' do

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
    expect(current_path).not_to eq('/spaces/2')
    expect(page).to have_content('One')
  end
end
