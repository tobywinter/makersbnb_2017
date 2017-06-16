feature 'update space' do
  scenario 'host wants to update the current space' do
    sign_up
    sign_in
    visit('/spaces/new')
    create_space(name: 'OneUpdate')

    within 'ul#spaces' do
      expect(page).to have_content('OneUpdate')
    end
    visit('/spaces/new')
    create_space(name: 'TwoUpdate')

    within 'ul#spaces' do
      expect(page).to have_content('OneUpdate')
      expect(page).to have_content('TwoUpdate')
    end

    first(:link, 'See Space').click
    expect(current_path).to eq("/spaces/#{Space.all[-2].id}")
    expect(page).to have_content('OneUpdate')

    click_button('Edit Space')
    expect(current_path).to eq("/spaces/#{Space.all[-2].id}/update")

    fill_in('description', with: 'Shoe Box')
    fill_in('rate', with: 100)

    click_button('Update my Space')
    expect(current_path).to eq("/spaces/#{Space.all[-2].id}")
    expect(page).to have_content('Shoe Box')
  end
  
   scenario 'host wants to discard the current changes in a space' do
    sign_up
    sign_in
    visit('/spaces/new')
    fill_in('name', with: 'OneUpdateDiscard')
    # filling in the default values
    enter_generic_details

    within 'ul#spaces' do
      expect(page).to have_content('OneUpdateDiscard')
    end
    visit('/spaces/new')
    fill_in('name', with: 'TwoUpdateKeep')
    enter_generic_details

    within 'ul#spaces' do
      expect(page).to have_content('OneUpdateDiscard')
      expect(page).to have_content('TwoUpdateKeep')
    end

    first(:link, 'See Space').click

    expect(current_path).to eq('/spaces/8')
    expect(page).to have_content('OneUpdateDiscard')

    click_button('Edit Space')
    expect(current_path).to eq('/spaces/8/update')

    fill_in('description', with: 'Shoe Box')
    fill_in('rate', with: 100)

    click_button('Discard my changes')
    expect(current_path).to eq('/spaces/8')
    expect(page).not_to have_content('Shoe Box')
  end
  
end
