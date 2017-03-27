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
