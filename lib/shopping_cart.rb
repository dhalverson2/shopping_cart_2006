class ShoppingCart

  attr_reader :name,
              :capacity,
              :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    {:name => @name, :capacity => @capacity.to_i}
  end

  def total_number_of_products
    @products.sum do |product|
      product.quantity
    end
  end

  def is_full?
    total_number_of_products >= @capacity.to_i
  end

  def products_by_category(category)
    @products.find_all do |product|
      product.category == category
    end
  end

end
