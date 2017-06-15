feature 'update space' do
  scenario 'host want to update the current space' do
    sign_up
    sign_in
    visit('/spaces/new')
    create_space(name: 'One')

    within 'ul#spaces' do
      expect(page).to have_content('One')
    end
    visit('/spaces/new')
    create_space(name: 'Two')

    within 'ul#spaces' do
      expect(page).to have_content('One')
      expect(page).to have_content('Two')
    end

    first(:link, 'See Space').click
    expect(current_path).to eq("/spaces/#{Space.all[-2].id}")
    expect(page).to have_content('One')

    click_button('Edit Space')
    expect(current_path).to eq("/spaces/#{Space.all[-2].id}/update")

    fill_in('description', with: 'Shoe Box')
    fill_in('rate', with: 100)

    click_button('Update my Space')
    expect(current_path).to eq("/spaces/#{Space.all[-2].id}")
    expect(page).to have_content('Shoe Box')

  end
end
