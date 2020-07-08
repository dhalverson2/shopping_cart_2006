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

  # def products_by_category(category)
  #   @products.find_all do |product|
  #     product.category == category
  #   end
  # end

  def products_by_category(category)
    result = []
    @products.each do |product|
      result << product if product.category == category
    end
    result
  end

  def percentage_occupied
    ((total_number_of_products / @capacity.to_f) * 100).round(2)
  end

  # def sorted_products_by_quantity
  #   @products.sort_by! do |product|
  #     -product.quantity
  #   end
  # end

  # def sorted_products_by_quantity
  #   (@products.sort_by(&:quantity)).reverse
  # end

  def sorted_products_by_quantity
    @products.sort { |a, b| b.quantity <=> a.quantity }
  end

  def product_breakdown
    result = {}
    @products.each do |product|
      if result[product.category]
        result[product.category] << product
      else
        result[product.category] = [product]
      end
    end
    result
  end
end
