require 'purchase_order'
require 'customer'
require 'product'

describe PurchaseOrder do

	let(:web_customer) { Customer.new("Bob", :web) }
	let(:company_customer) { Customer.new("Bob", :company) }
	let(:purchase_order) { PurchaseOrder.new(company_customer) }
	let(:product) { Product.new("guitar", 5) }

	describe "creating a purchase order" do
		it 'raises an error if a customer object is not supplied' do
			expect { PurchaseOrder.new("Bob") }.to raise_error
		end

		it 'raises an error if the customer is not a company' do
			expect { PurchaseOrder.new(web_customer) }.to raise_error "Customer must be a company account"
		end
	end

  describe "#add_product" do
    it 'adds the product to the products hash' do
      purchase_order.add_product(product, 1)
      expect(purchase_order.products).to include product
    end
  end

  describe "#show_purchase_order" do
    it 'show the purchase order on the cmd line with some basic formatting' do
      purchase_order.add_product(product, 1)
      expect(purchase_order.show_purchase_order).to include "Item: $5.0 / Quantity: 1\n"
    end
  end

  describe "#purchase_order_total" do
    it 'calculates the correct purchase order total with one product with quantity of 1' do
      purchase_order.add_product(product, 1)
      expect(purchase_order.purchase_order_total).to eq 5.00
    end

    it 'calculates the correct order total with one product with quantity of 1' do
      product_two = Product.new("bass", 10)
      purchase_order.add_product(product, 1)
      purchase_order.add_product(product_two, 4)
      expect(purchase_order.purchase_order_total).to eq 45.00
    end
  end

end
