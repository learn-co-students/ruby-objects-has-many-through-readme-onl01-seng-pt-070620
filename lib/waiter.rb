class Waiter
  attr_accessor :years, :name

  @@all = []

  def initialize(name, years)
    @years = years
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
  
  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select{|meals| meals.waiter == self}
  end
  
  def best_tipper
    best_tip = meals.max{|meal_1, meal_2| meal_1.tip <=> meal_2.tip}
    best_tip.customer
  end

end