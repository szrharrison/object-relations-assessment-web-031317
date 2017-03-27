class Restaurant
  def initialize(name)
    @name = name
    ALL << self
  end
  attr_accessor :name
  ######################################################
  ALL = []

  def self.all
    ALL
  end

  def self.find_by_name( name )
    self.all.find do |restaurant|
      restaurant.name == name
    end
  end
  ######################################################
  def reviews
    Review.all.select do |review|
      review.restaurant == self
    end
  end

  def customers
    self.reviews.map do |review|
      review.customer
    end
  end
end
