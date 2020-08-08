require 'pry'
class Waiter

  attr_accessor :name, :yrs_experience
  
  @@all = []
  
  def initialize (name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end
  
  def self.all
    @@all
  end
    
  def new_meal(customer, total, tip = 0) 
    Meal.new(self, customer, total, tip) 
  end
  
  def meals
    Meal.all.select {|m| m.waiter == self} 
  end  
  
  def best_tipper 
    meals2 = meals.sort_by {|t| t.tip} 
    best_tip = meals2[-1] 
    best_tip.customer 
  end
  
end