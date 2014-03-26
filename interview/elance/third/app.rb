#encoding: utf-8
require 'sinatra'
require_relative 'config'
require_relative 'user'

class APP < Sinatra::Base
  
  get '/users' do
    users = User.all
    [200, {'Content-Type' => 'application/json'}, users.to_json]
  end

  post '/users' do
    user = User.new email: params[:email]
    if user.save
      [200, {'Content-Type' => 'application/json'}, user.to_json]
    else
      [400, {'Content-Type' => 'application/json'}, user.errors.to_json]
    end
  end

  put '/users/:id' do
    user = User.where(id: params[:id]).first
    if user 
      user.email = params[:email]
      if user.save
        [200, {'Content-Type' => 'application/json'}, user.to_json]
      else
        [400, {'Content-Type' => 'application/json'}, user.errors.to_json]
      end
    else
      [404, {'Content-Type' => 'application/json'}, nil]
    end
  end

  delete '/users/:id' do
    user = User.where(id: params[:id]).first
    if user
      user.destroy
      [204, {'Content-Type' => 'application/json'}, nil]
    else
      [404, {'Content-Type' => 'application/json'}, nil]
    end
  end
end
