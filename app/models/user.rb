require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource
  include BCrypt
  attr_accessor :password_digest, :password_confirmation
  attr_reader :password

  property :id, Serial
  property :email, String
  property :password_digest, Text

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  validates_confirmation_of :password
end
