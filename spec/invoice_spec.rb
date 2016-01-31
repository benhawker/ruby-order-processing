require 'invoice'

describe Invoice do

  let(:customer) { Customer.new("Bob", :company) }
  let(:product) { Product.new("guitar", 5) }
  let(:invoice) { Invoice.new(customer, products) }

  describe "#show_invoice" do
    xit 'show the invoice on the cmd line with some basic formatting' do
      expect(invoice.show_invoice).to include "Item: $5.0 / Quantity: 1\n"
    end
  end

end