# Please copy/paste all three classes into this file to submit your solution!
######################################################
# Begin Class Review
######################################################
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
######################################################
# Begin Class Restaurant
######################################################
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
######################################################
# Begin Class Customer
######################################################
class Customer
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    ALL << self
  end
  attr_accessor :first_name, :last_name
  ######################################################
  ALL = []

  def self.all
    ALL
  end

  def self.find_by_name( name )
    self.all.find do |customer|
      customer.full_name == name
    end
  end

  def self.find_all_by_first_name( name )
    self.all.select do |customer|
      customer.first_name == name
    end
  end

  def self.all_names
    self.all.map do |customer|
      customer.full_name
    end
  end
  ######################################################
  def full_name
    "#{first_name} #{last_name}"
  end

  def add_review( restaurant, content )
    Review.new( content, self, restaurant )
  end
end
