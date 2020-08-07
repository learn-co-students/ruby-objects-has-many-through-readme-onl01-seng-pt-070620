class Customer

  attr_accessor :name, :age

  @@all = []

  def initialize (name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

  def meals  #returning the meal's customer matches the current customer
    Meal.all.select do |meal|
      meal.customer == self
    end
  end

  def waiters  #a list of all the waiters the customer has interacted with
    meals.map do |meal|
      meal.waiter
    end
  end

end
