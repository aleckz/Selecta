require 'dm-timestamps'

class Link
  include DataMapper::Resource

  property :id,         Serial
  property :title,      String
  property :url,        String, required: true
  property :created_at, DateTime

  has n,      :likes
  belongs_to  :user

  def self.number_of_likes params
    Link.get(params[:link_id]).likes.count
  end
end