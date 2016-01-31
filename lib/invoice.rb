class Invoice

  attr_reader :customer, :products
  attr_accessor :total

  def initialize(customer, products)
    @products = {}
    @customer = customer
    @payment_recieved = false
  end

  def show_invoice
    return products.map { |product, quantity| "Item: $#{product.price} / Quantity: #{quantity}\n" }
  end

end