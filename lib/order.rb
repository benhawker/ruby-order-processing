class Order

	attr_reader :products, :customer
	attr_accessor :status

	def initialize(customer)
		@products = {}
		@status = :pending
		@customer = customer
	end

	def add_product(product, quantity = 1)
		@products[product] = (@products[product] ? @products[product] + quantity :  quantity )

		puts "You haved added #{quantity} #{product.title}'s to your order"
	end

end