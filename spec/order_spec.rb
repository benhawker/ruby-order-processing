require 'order'
require 'product'
require 'customer'

describe Order do

  let(:customer) { Customer.new("Bob", :web) }
  let(:product) { Product.new("guitar", 5) }
  let(:order) { Order.new(customer) }


  describe "creating an order" do
    it 'a new order is pending by default' do
      expect(order.status).to eq :pending
    end
  end

  describe "add_product" do
    it 'adds the product to the products hash' do
      order.add_product(product, 1)
      expect(order.products).to include product
    end
  end

end

