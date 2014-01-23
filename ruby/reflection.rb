
module Mudule
  Mudule='mudule constant'

  def self.included(params)
    p "trigger included event, params is #{params}"
    p "trigger included event, self is #{self}"
  end

  def mudule
    'i am #mudule'
  end
  def self.mudule
    'i am .mudule'
  end
end

class Superklass
  Superklass='superklass constant'
  
  def self.inherited(params)
    p "trigger inherited event, params is #{params}"
    p "trigger inherited event, self is #{self}"
  end

  def super_klass
    'i am #super_klass'
  end
  class << self
    def super_klass
      'i am .super_klass'
    end
  end
end

class Klass < Superklass
  include Mudule
  
  Klass='klass constant'

  def klass
    'i am #klass'
  end

  class << self
    def klass
      'i am .klass'
    end
  end
end
