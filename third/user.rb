#encoding: utf-8

class User < ActiveRecord::Base

  validates :email, presence: true

end
