#encoding: utf-8

# run 'ruby main.rb' and input '47 3'
require_relative 'stars_calculator'
puts 'input params is like 47 3:'
loop do
  val = gets
  arr = val.split(' ')
  p StarsCalculator.number_str_stars(arr[0], arr[1])
end
