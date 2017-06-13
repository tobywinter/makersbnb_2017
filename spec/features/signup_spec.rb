feature "Sign Up" do
  scenario "User Sign Ups" do
    sign_up
    expect(page).to have_current_path '/'
    expect(page).to have_content('Welcome user@test.com')
  end

  scenario "User 2 Sign Up" do
    sign_up(email: 'user2@test.com',
            password: 'password',
            password_confirmation: 'password')
    expect(page).to have_current_path '/'
    expect(page).to have_content('Welcome user2@test.com')
  end
end
