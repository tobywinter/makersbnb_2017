class User
  include DataMapper::Resource

  attr_reader :email, :password

  property :id,                     Serial
  property :email,                  String
  property :password,               String
  property :password_confirmation,  String
end
