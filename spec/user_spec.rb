require_relative '../app/models/user.rb'
describe User do

  let!(:user) do
    User.create(email: 'user@test.com', password: 'password123', password_confirmation: 'password123')
  end

  it 'authenticates when given valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given invalid password' do
    expect(User.authenticate(user.email, 'not_password')).to be_nil
  end

end
