class Review
  def initialize( content, customer, restaurant )
    @content = content
    @customer = customer
    @restaurant = restaurant
    ALL << self
  end
  attr_accessor :content, :customer, :restaurant
  ######################################################
  ALL = []

  def self.all
    ALL
  end
end
