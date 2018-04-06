require "./product.rb"

describe Product do
  describe "exempt product" do
    product = Product.new({ name: 'book', quantity: 1, price: 10.00, is_exempt: true, is_imported: false })

    it "should have basic sale tax at 0%" do
      expect(product.basic_sales_tax).to eql(0.0)
    end
  end

  describe "non-exempt product" do
    product = Product.new({ name: 'music cd', quantity: 1, price: 10.00, is_exempt: false, is_imported: false })

    it "should have basic sale tax at 10%" do
      expect(product.basic_sales_tax).to eql(1.0)
    end
  end

  describe "imported product" do
    product = Product.new({ name: 'imported music cd', quantity: 1, price: 10.00, is_exempt: false, is_imported: true })

    it "should have import tax at 5%" do
      expect(product.import_tax).to eql(0.5)
    end
  end

  describe "non-imported product" do
    product = Product.new({ name: 'imported music cd', quantity: 1, price: 10.00, is_exempt: false, is_imported: false })

    it "should have import tax at 0%" do
      expect(product.import_tax).to eql(0.0)
    end
  end
end
