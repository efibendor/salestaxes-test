require "./product.rb"
require "./purchase.rb"

describe Purchase do
  describe "purchase" do
    purchase = Purchase.new
    product = Product.new({ name: 'book', quantity: 1, price: 10.00, is_exempt: true, is_imported: false })
    purchase.add_product(product)

    it "should have 1 product in the list" do
      expect(purchase.products.length).to eql(1)
    end
  end

  describe "purchase" do
    purchase = Purchase.new
    product1 = Product.new({ name: 'book', quantity: 1, price: 12.49, is_exempt: true, is_imported: false })
    purchase.add_product(product1)

    product2 = Product.new({ name: 'chocolate', quantity: 1, price: 0.85, is_exempt: true, is_imported: false })
    purchase.add_product(product2)

    product3 = Product.new({ name: 'music cd', quantity: 1, price: 16.49, is_exempt: false, is_imported: false })
    purchase.add_product(product3)

    it "should have 3 products" do
      expect(purchase.products.length).to eql(3)
    end

    it "should have total price equal to the sum of price of each product" do
      expect(purchase.total).to eql(product1.total + product2.total + product3.total)
    end

    it "should have sales taxes equal to the sum of tax of each product" do
      expect(purchase.sales_taxes).to eql(product1.sales_taxes + product2.sales_taxes + product3.sales_taxes)
    end
  end
end
