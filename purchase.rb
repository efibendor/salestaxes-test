require "./product.rb"

class Purchase
  attr_accessor :products

  def initialize
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def sales_taxes
    sales_taxes = 0.0

    @products.each do |product|
      sales_taxes += product.sales_taxes
    end

    sales_taxes
  end

  def total
    total = 0.0

    @products.each do |product|
      total += product.total
    end

    total
  end

  def output
    @products.each do |product|
      product.output
    end

    puts "Sales Taxes:" + sales_taxes.round(2).to_s
    puts "Total:" + total.round(2).to_s
  end
end
