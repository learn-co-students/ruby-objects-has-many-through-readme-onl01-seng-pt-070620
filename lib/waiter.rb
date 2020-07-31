class Waiter

  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip=0)
  end

  def meals
  Meal.all.select do |meal|
    meal.waiter == self #checking for waiter now
  end
end


  def best_tipper
    variable = meals.max do |a, b|
      a.tip <=> b.tip
    end
    variable.customer
  end

end
