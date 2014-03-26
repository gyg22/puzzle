#encoding: utf-8
require 'active_record'

module Puzzle
  module Config

    ActiveRecord::Base.establish_connection(
      :adapter => 'sqlite3',
      :database => './development.sqlite3'
    )
  end
end
