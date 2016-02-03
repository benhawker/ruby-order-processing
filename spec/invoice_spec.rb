require 'invoice'
require 'purchase_order'

describe Invoice do

  let(:customer) { Customer.new("Bob", :company) }
  let(:purchase_order) { PurchaseOrder.new(customer) }
  let(:product) { Product.new("guitar", 5) }

  before do
  	purchase_order.add_product(product, 1)
    @invoice = purchase_order.create_invoice
  end

  describe "#show_invoice" do
    it 'show the invoice on the cmd line with some basic formatting' do
      expect(@invoice.show_invoice).to include "Item: $5.0 / Quantity: 1\n"
    end
  end

  describe '.from_purchase_order' do
    
  end

end