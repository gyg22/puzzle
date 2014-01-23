#encoding: utf-8

module Bindo 
  
  def self.sort(*nums)
    i = 1
    while i < nums.length 
      element = nums[i]
      j = i-1
      while (j >= 0) && (nums[j] > element)
        nums[j+1] = nums[j]
        nums[j] = element
        j -= 1
      end
      i += 1
    end 
    nums 
  end

  def self.sum(arr=[])
    sum = 0
    arr.each do |e|
      sum += e 
    end
    sum
  end

end
