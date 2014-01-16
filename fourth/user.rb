class User 
  include DataMapper::Resource
  
  has n, :posts

  has n, :followed_people, 'FollowerFollowed', child_key: [:follower_id]
  has n, :follower_people, 'FollowerFollowed', child_key: [:followed_id]

  has n, :followeds, self, :through => :followed_people
     
  has n, :followers, self, :through => :follower_people

  property :id,   Serial
  property :name, String
  property :created_at, DateTime
  property :updated_at, DateTime
  property :deleted_at, DateTime 

end
