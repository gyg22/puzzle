#encoding: utf-8

require 'sinatra'
require 'data_mapper'
require_relative 'config'
require_relative 'user'
require_relative 'follower_followed'
require_relative 'post'

DataMapper.finalize
DataMapper.auto_migrate!

class APP < Sinatra::Base

end
