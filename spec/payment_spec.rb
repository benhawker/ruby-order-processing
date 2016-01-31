require 'payment'

describe Payment do

  describe "creating a new payment object" do
    it 'raises a validation error if the payment method is not included in #"{Payment::VALID_METHODS_OF_PAYMENT}"' do
      expect { Payment.new(:monopoly_money, 74) }.to raise_error "This is not a valid payment method"
    end

    it "raises a validation error if the order amount is zero" do
      expect { Payment.new(:credit_card, 0) }.to raise_error "Uh oh, your order appears to be empty"
    end
  end

end
