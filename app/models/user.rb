class User
  include DataMapper::Resource

  attr_reader :email, :password

  property :id,               Serial
  property :email,            String
  property :password,         String

end
