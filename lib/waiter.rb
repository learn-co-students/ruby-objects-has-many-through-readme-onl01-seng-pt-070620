require 'pry'
class Waiter
  
  attr_reader :age 
  attr_accessor :years_of_experience, :customer
  
  @@all = []
  
  def initialize(age,years_of_experience)
    @age = age 
    @years_of_experience = years_of_experience
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
  def new_meal(customer, total, tip)
   Meal.new(self, customer, total, tip)
  end
  
  def meals
    Meal.all.select {|meal| meal.waiter == self }
  end
  
  def best_tipper
    x = meals
    best_tip = 0
    best_tipper = nil
    x.each do |xmeal| 
      if xmeal.tip > best_tip
        best_tip = xmeal.tip
        best_tipper = xmeal.customer
      end     #ends if
    end       #ends each 
    best_tipper
  end
  
  
end