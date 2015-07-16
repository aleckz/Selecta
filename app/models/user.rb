require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader   :password
  attr_accessor :password_confirmation

  property :id,              Serial
  property :username,        String, required: true
  property :email,           String, required: true
  property :password_digest, Text

  has n, :links
  has n, :likes

  validates_confirmation_of :password

  def password= password
    @password = password
    self.password_digest = BCrypt::Password.create password
  end

  def self.authenticate password
    binding.pry
    BCrypt::Password.new password
  end
end
