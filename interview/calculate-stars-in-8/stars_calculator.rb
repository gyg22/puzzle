#encoding: utf-8

class StarsCalculator

  BORDER_POINT = [ 
    { borders: 6, points: 6 },  
    { borders: 2, points: 3 }, 
    { borders: 5, points:6 }, 
    { borders: 5, points: 6 }, 
    { borders: 4, points: 5 }, 
    { borders: 5, points: 6 }, 
    { borders: 6, points: 6 }, 
    { borders: 3, points: 4 }, 
    { borders: 7, points: 6 }, 
    { borders: 6, points: 6 }
  ] 
  
  def self.number_str_stars(number_str, unit=3)
    arr = number_str.split('')
    total_stars = 0
    arr.each do |num|
      num = num.to_i
      total_stars += single_number_stars(num, unit.to_i)
    end
    total_stars
  end
  
  def self.single_number_stars(single_num, unit)
    single_num_hash = BORDER_POINT[single_num]
    unit -= 2
    single_num_hash[:borders] * unit + single_num_hash[:points]
  end

end#StarsCalculator

