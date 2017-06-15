feature 'list a space' do
  scenario 'when signed in' do
    sign_up
    sign_in
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
  end

  scenario 'not able to list space when not signed in' do
    visit('/spaces/new')
    expect(current_path).to eq ('/sessions/new')
    expect(page).to have_content('Please sign in')
  end
end
