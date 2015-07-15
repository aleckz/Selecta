class Like
  include DataMapper::Resource

  property :id,    Serial

  belongs_to :link
  belongs_to :user
end