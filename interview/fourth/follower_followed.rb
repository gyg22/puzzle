#encoding: utf-8

class FollowerFollowed 

  include DataMapper::Resource

  belongs_to :follower, 'User', :key => true

  belongs_to :followed, 'User', :key => true

end


