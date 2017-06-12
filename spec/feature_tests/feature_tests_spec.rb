feature "Feature Tests" do
  scenario "User Sign Up" do
    visit '/users/new'
    fill_in 'email', with:'user@test.com'
    fill_in 'password', with:'password'
    click_button 'Sign up'
    expect(page).to have_current_path '/'
    expect(page).to have_content('Welcome user@test.com')
  end

  scenario "User 2 Sign Up" do
    visit '/users/new'
    fill_in 'email', with:'user2@test.com'
    fill_in 'password', with:'password2'
    click_button 'Sign up'
    expect(page).to have_current_path '/'
    expect(page).to have_content('Welcome user2@test.com')
  end
end
