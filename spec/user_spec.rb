require_relative '../app/models/user.rb'
describe User do
  subject(:user) { described_class.new('user@test.com', 'password') }

  it 'has an email and password' do
    expect(user.email).to eq('user@test.com')
    expect(user.password).to eq('password')
  end

end
