#encoding: utf-8

#http://en.wikipedia.org/wiki/Prime_number
#A prime number (or a prime) is a natural number greater than 1 that has no 
#positive divisors other than 1 and itself)

(14..176).each do |x|
  (2...x).each do |y|
    break if (x % y) == 0
    puts x if (x - y) == 1
  end
end

