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

  describe "#add_product" do
    it 'adds the product to the products hash' do
      order.add_product(product, 1)
      expect(order.products).to include product
    end
  end

  describe "#show_order" do
    it 'show the order on the cmd line with some basic formatting' do
      order.add_product(product, 1)
      expect(order.show_order).to include "Item: $5.0 / Quantity: 1\n"
    end
  end

  describe "#order_total" do
    it 'calculates the correct order total with one product with quantity of 1' do
      order.add_product(product, 1)
      expect(order.order_total).to eq 5.00
    end

    it 'calculates the correct order total with one product with quantity of 1' do
      product_two = Product.new("bass", 10)
      order.add_product(product, 1)
      order.add_product(product_two, 4)
      expect(order.order_total).to eq 45.00
    end
  end

end
