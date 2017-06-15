feature 'update space' do
  scenario 'host want to update the current space' do
    sign_up
    sign_in
    visit('/spaces/new')
    fill_in('name', with: 'OneUpdate')
    enter_generic_details

    within 'ul#spaces' do
      expect(page).to have_content('OneUpdate')
    end
    visit('/spaces/new')
    fill_in('name', with: 'TwoUpdate')
    enter_generic_details

    within 'ul#spaces' do
      expect(page).to have_content('OneUpdate')
      expect(page).to have_content('TwoUpdate')
    end

    first(:link, 'See Space').click

    expect(current_path).to eq('/spaces/6')
    expect(page).to have_content('OneUpdate')

    click_button('Edit Space')
    expect(current_path).to eq('/spaces/6/update')

    fill_in('description', with: 'Shoe Box')
    fill_in('rate', with: 100)

    click_button('Update my Space')
    expect(current_path).to eq('/spaces/6')
    expect(page).to have_content('Shoe Box')

  end
end
