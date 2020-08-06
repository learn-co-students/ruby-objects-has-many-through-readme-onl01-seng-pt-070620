require 'pry'
class Customer
  @@all = []
  attr_reader :name, :age
  def initialize(name,age)
    @name = name 
    @age = age
    @@all << self 
  end
  def self.all 
    @@all 
  end
  
  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end
  
  def meals
    Meal.all.select {|meal| meal.customer == self }
  end
  
  def waiters
    x = meals
    y = []
    x.each {|xmeal| y << xmeal.waiter}
    y 
  end
  
end