require 'order'

describe Order do

  describe "creating an order" do
    it 'a new order is pending by default' do
      order = Order.new
      expect(order.status).to eq :pending
    end
  end

end