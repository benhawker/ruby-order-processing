class Order

	attr_reader :products
	attr_accessor :status

	def initialize
		@products = {}
		@status = :pending
	end

end