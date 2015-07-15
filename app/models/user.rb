require 'data_mapper'

class User
  include DataMapper::Resource

  property :id,       Serial
  property :username, String, required: true
  property :email,    String, required: true

  has n, :links
  has n, :likes
end