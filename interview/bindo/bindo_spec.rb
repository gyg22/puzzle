#encoding: utf-8

require_relative 'bindo'

describe Bindo do

  describe '.bindo' do
    it 'sorts a group of numbers' do
      1000.times do
        sorted_arr = Bindo.sort(
                       rand(100), rand(100), rand(100), rand(100), rand(100), 
                       rand(100), rand(100), rand(100), rand(100), rand(100), 
                       rand(100), rand(100), rand(100), rand(100), rand(100), 
                       rand(100), rand(100), rand(100), rand(100), rand(100), 
                       rand(100), rand(100), rand(100), rand(100), rand(100) 
                     )
                       
        expect(sorted_arr).to eq(sorted_arr.sort)
      end
    end
  end#.bindo

  describe '.sum' do
    it 'sums an array of numbers' do
      1000.times do
        arr = [ 
          rand(100), rand(100), rand(100), rand(100), rand(100), 
          rand(100), rand(100), rand(100), rand(100), rand(100), 
          rand(100), rand(100), rand(100), rand(100), rand(100), 
          rand(100), rand(100), rand(100), rand(100), rand(100), 
          rand(100), rand(100), rand(100), rand(100), rand(100) 
        ] 
                       
        expect(Bindo.sum arr).to eq(arr.inject{|sum,x| sum + x })
      end
    end
  end#.sum

end
