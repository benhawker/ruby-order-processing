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

	def show_order
		return products.map { |product, quantity| "Item: $#{product.price} / Quantity: #{quantity}\n" }
	end

	def order_total
		products.inject(0){|memo, (product, quantity)| (product.price * quantity) + memo}.to_f.round(2)
	end

end