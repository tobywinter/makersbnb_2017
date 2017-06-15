feature 'Sign Out' do
  before(:each) do
    User.create(email: 'user@test.com',
    password: 'password',
    password_confirmation: 'password')
  end

  scenario 'while being signed in' do
    sign_in(email: 'user@test.com', password: 'password')
    click_button 'Sign Out'
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content('Ciao!!')
    expect(page).not_to have_content('Welcome, user@test.com')
  end
end
