require 'dm-timestamps'

class Link
  include DataMapper::Resource

  property :id,         Serial
  property :title,      String
  property :url,        String, required: true
  property :created_at, DateTime

  has n, :likes
end