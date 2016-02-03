require 'order'
require 'product'
require 'customer'

describe Order do

  let(:customer) { Customer.new("Bob", :web) }
  let(:product) { Product.new("guitar", 5) }
  let(:order) { Order.new(customer) }
  let(:other_product) { Product.new("drums", 10) }

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

  describe "#change_status" do
    it 'raises an error if the status is not included in #"{Customer::VALID_TYPES}"' do
      expect { order.change_status("bob") }.to raise_error "This is not a valid order status please try again"
    end

    it 'changes the status if the status given is valid' do
      order.change_status(:shipped)
      expect(order.status).to eq :shipped
    end
  end

  describe "#confirm_order" do
    it 'raises an error if the method_of_payment is not included in #"{Payment::VALID_METHODS_OF_PAYMENT}"' do
      expect { order.confirm_order("bob") }.to raise_error "This is not a valid payment method"
    end

    it 'raises an error if method_of_payment is credit card but any product is out of stock' do
      other_product.in_stock = false
      order.add_product(other_product, 1)
      expect { order.confirm_order(:credit_card) }.to raise_error "Cannot make credit card payment now, as some products are out of stock"
    end

    it 'raises an error if the order total is zero' do
      expect { order.confirm_order(:credit_card) }.to raise_error "Uh oh, your order appears to be empty"
    end

    let(:payment) { double :payment }

    it "returns a payment" do
      expect(Payment).to receive(:new).with(:credit_card, 15.0).and_return(payment)
      order.add_product(product, 3)
      expect(order.confirm_order(:credit_card)).to eq(payment)
    end
  end

  describe '.from_purchase_order' do
    
  end

    def self.from_purchase_order(purchase_order)
    new.tap(purchase_order.customer) do |invoice|
      invoice.products = purchase_order.products.clone
    end
  end

  describe "#all_products_in_stock?" do
    it 'returns true if all products in the order are in stock' do
      order.add_product(product, 3)
      expect(order.send(:all_products_in_stock?)).to be true
    end

    it 'returns false if any products in the order are out of stock' do
      order.add_product(product, 3)
      other_product.in_stock = false
      order.add_product(other_product, 1)
      expect(order.send(:all_products_in_stock?)).to be false
    end
  end

end
