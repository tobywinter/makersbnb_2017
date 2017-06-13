class User
  include DataMapper::Resource

  attr_reader :email, :password

  property :id,                     Serial
  property :email,                  String, required: true
  property :password,               String
  property :password_confirmation,  String

  validates_confirmation_of :password
  validates_format_of       :email, as: :email_address

end
