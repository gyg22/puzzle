#encoding: utf-8

require 'sinatra/base'
require_relative 'stars_calculator'

class App < Sinatra::Base
  
  get '/' do
    erb :new, locals: { result: 0 }
  end

  get '/submit' do
    result = StarsCalculator.number_str_stars(params[:number], params[:unit])
    erb :new, :locals => { :result => result } 
  end

end#App
