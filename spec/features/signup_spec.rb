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

  scenario 'password does not match validation' do
      expect { sign_up(password_confirmation: 'notthepassword') }.not_to change(User, :count)
      expect(current_path).to eq('/users')
      expect(page).to have_content 'Password does not match the confirmation'
    end

    scenario 'email is required to submit the form and create a user' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'email must be in proper format' do
    expect { sign_up(email: 'user@test') }.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'user must use a unique email to sign up' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
