feature "Feature Tests" do
  scenario "User Sign Up" do
    visit '/users/new'
    fill_in 'email', with:'user@test.com'
    fill_in 'password', with:'password'
    click_button 'Sign up'
    expect(page).to have_current_path '/'
    expect(page).to have_content('Welcome user@test.com')
  end
end
