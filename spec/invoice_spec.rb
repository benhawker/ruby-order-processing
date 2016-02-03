require 'invoice'
require 'purchase_order'
require 'customer'
require 'product'

describe Invoice do

  # let(:customer) { Customer.new("Bob", :company) }
  # let(:purchase_order) { PurchaseOrder.new(customer) }
  # let(:product) { Product.new("guitar", 5) }

  # before(:each) do
  # 	purchase_order.add_product(product, 1)
  #   @invoice = purchase_order.create_invoice
  # end

  # describe "#show_invoice" do
  #   it 'show the invoice on the cmd line with some basic formatting' do
  #     expect(@invoice.show_invoice).to include "Item: $5.0 / Quantity: 1\n"
  #   end
  # end

  let(:customer) { double("Customer", type: :company) }
  let(:purchase_order) { PurchaseOrder.new(customer) }

  before do

  end

  describe '.from_purchase_order' do
    it "creates an invoice with the same products" do
      @new_invoice = Invoice.from_purchase_order(purchase_order)
      expect(@new_invoice.products).to eq (purchase_order.products)

      p "Hello"
      p purchase_order.products
    end
  end

end