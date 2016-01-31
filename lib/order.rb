class Order

	VALID_STATUSES = [:pending, :paid, :shipped]

	attr_reader :products, :customer
	attr_accessor :status, :total

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
		self.total = products.inject(0){|memo, (product, quantity)| (product.price * quantity) + memo}.to_f.round(2)
	end

	def change_status(status)
		raise "This is not a valid order status please try again" unless VALID_STATUSES.include? status
		self.status = status
	end

	def confirm_order(method_of_payment)
		order_total
		Payment.new(method_of_payment, self.total)
	end

	private

	def all_products_in_stock?
		count = @products.select { |product| product.in_stock == false }.size
		count == 0 ? true : false
	end

end