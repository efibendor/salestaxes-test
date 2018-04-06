require "csv"
require "./product.rb"
require "./purchase.rb"

class SalesTaxes
  BOOK_KEYWORDS = ["book"]
  FOOD_KEYWORDS = ["chocolate"]
  MEDICAL_KEYWORDS = ["pill", "headache"]

  def self.run
    input_file = ARGV[0]
    purchase = self.parse_input(input_file)
    purchase.output
  end

  def self.parse_input(file_name)
    purchase = Purchase.new
    index = 0

    CSV.foreach(file_name) do |row|
      if index == 0
        index += 1
        next
      end

      params = { name: row[1], quantity: row[0].to_i, price: row[2].to_f.round(2) }
      params[:is_imported] = params[:name].include?("imported")
      params[:is_exempt] = false

      (BOOK_KEYWORDS + FOOD_KEYWORDS + MEDICAL_KEYWORDS).each do |keyword|
        params[:is_exempt] = params[:is_exempt] || params[:name].include?(keyword)
      end

      product = Product.new(params)
      purchase.add_product(product)
      index += 1
    end

    purchase
  end
end

SalesTaxes.run
