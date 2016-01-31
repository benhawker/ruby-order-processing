class Payment

	VALID_METHODS_OF_PAYMENT = [:credit_card, :check]

	attr_accessor :method_of_payment, :amount

	def initialize(method_of_payment, amount)
		@method_of_payment = method_of_payment
		@amount = amount

		validate!
	end

	private

	def validate!
		raise "This is not a valid payment method" unless VALID_METHODS_OF_PAYMENT.include? self.method_of_payment
		raise "Uh oh, your order appears to be empty" unless self.amount.to_f.round(2) > 0
	end

end