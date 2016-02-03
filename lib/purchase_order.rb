class PurchaseOrder

  attr_reader :customer, :products
  attr_accessor :total

  def initialize(customer)
    @products = {}
    @customer = customer

    validate!
  end

  def add_product(product, quantity = 1)
    @products[product] = (@products[product] ? @products[product] + quantity :  quantity )

    puts "You haved added #{quantity} #{product.title}'s to your purchase order"
  end

  def show_purchase_order
    return products.map { |product, quantity| "Item: $#{product.price} / Quantity: #{quantity}\n" }
  end

  def purchase_order_total
    self.total = products.inject(0){|memo, (product, quantity)| (product.price * quantity) + memo}.to_f.round(2)
  end

  def confirm_purchase_order 
    purchase_order_total 
    raise "Your PO appears to be empty! Add some products and try again." unless self.total.to_f.round(2) > 0

    create_order
    create_invoice

    return "We have generated an Invoice and created an order."
  end

  def create_order
    Order.from_purchase_order(self)
  end

  def create_invoice
    Invoice.from_purchase_order(self)
  end

  private

  def validate!
    raise "Customer must be a company account" unless customer.type == :company
  end

end