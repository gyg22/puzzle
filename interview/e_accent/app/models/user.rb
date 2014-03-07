class User < ActiveRecord::Base
  
  #returns validating rule by endian
  def self.birthday_format
    date_format = EAccent::Application::AppConfig['date_format']    
    case date_format
      when 'big-endian'
        /\A([0-9]{4})[. \/-](0[1-9]|1[0-2])[. \/-](0[1-9]|[1-2][0-9]|3[0-1])\z/ 
      when 'middle-endian'
        /\A(0[1-9]|1[0-2])[. \/-](0[1-9]|[1-2][0-9]|3[0-1])[. \/-]([0-9]{4})\z/ 
      when 'little-endian'
        /\A(0[1-9]|[1-2][0-9]|3[0-1])[. \/-](0[1-9]|1[0-2])[. \/-]([0-9]{4})\z/ 
    end
  end
      
  #validates by different endian
  validates :birthday, format: {with: lambda{|user| User.birthday_format}}
  
  #before create or update, make birthday consistent
  before_save :format_date
  
  #converts birthday into endian specific format
  def birthday_to_endian
    year, month, day = self.birthday.split('-') 
    date_format = EAccent::Application::AppConfig['date_format']    
    case date_format
      when 'big-endian' then year + ' ' + month + ' ' + day
      when 'middle-endian' then month + ' ' + day + ' ' + year
      when 'little-endian' then day + ' ' + month + ' ' + year
    end
  end

  private
  def format_date
    matched_data = self.birthday.match(User.birthday_format).captures
    date_format = EAccent::Application::AppConfig['date_format']    
    case date_format
      when 'big-endian'
        self.birthday = matched_data[0] + '-' + matched_data[1] + '-' + matched_data[2]
      when 'middle-endian'
        self.birthday = matched_data[2] + '-' + matched_data[0] + '-' + matched_data[1]
      when 'little-endian'
        self.birthday = matched_data[2] + '-' + matched_data[1] + '-' + matched_data[0]
    end
  end
end
