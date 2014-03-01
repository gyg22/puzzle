#encoding: utf-8

class Post
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :title, String
  property :body, Text
  property :created_at, DateTime
  property :updated_at, DateTime
  property :deleted_at, DateTime
end
