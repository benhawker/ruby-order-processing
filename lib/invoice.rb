class Invoice

  attr_reader :customer
  attr_accessor :total, :products

  def initialize(customer, products)
    @products = {}
    @customer = customer
    @payment_recieved = false
  end

  def show_invoice
    return products.map { |product, quantity| "Item: $#{product.price} / Quantity: #{quantity}\n" }
  end

  def self.from_purchase_order(purchase_order)
    new(purchase_order.customer, purchase_order.products.clone)
  end

end