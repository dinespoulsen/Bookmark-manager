require "bcrypt"
require 'dm-validations'


class User

include DataMapper::Resource

  property :id, Serial
  property :email, String, :required => true
  property :password_digest, Text, :required => true
  attr_reader :password
  attr_accessor :password_confirmation

  validates_format_of :email, :as => :email_address
  validates_uniqueness_of :email
  validates_confirmation_of :password


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
