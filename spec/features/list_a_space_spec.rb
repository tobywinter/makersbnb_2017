feature 'list a space' do
  scenario 'when signed in' do
    sign_up
    sign_in
    visit('/spaces/new')
    create_space
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
