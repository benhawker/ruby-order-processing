class Invoice

  attr_reader :customer, :products
  attr_accessor :total

  def initialize(customer, products)
    @products = {}
    @customer = customer
    @payment_recieved = false
  end

end