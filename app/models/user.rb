require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_accessor :password_confirmation
  attr_reader   :password

  property :id,              Serial
  property :username,        String, required: true
  property :email,           String, required: true
  property :password_digest, String

  has n, :links
  has n, :likes

  validates_confirmation_of :password

  def password= password
    @password = password
    self.password_digest = BCrypt::Password.create password
  end
end