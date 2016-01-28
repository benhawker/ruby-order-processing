require 'customer'

describe Customer do 

	describe "creating a customer" do
		it 'raises an error if the customer type is not included in #"{Customer::VALID_TYPES}"' do
			expect { Customer.new(:bob) }.to raise_error "This is not a valid type of customer"
		end
	end

end