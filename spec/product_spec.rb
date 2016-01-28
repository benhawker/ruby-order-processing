require 'product'

describe Product do

	describe "creating a product" do
		it 'new products are in stock by default' do
			product = Product.new("guitar")
			expect(product.in_stock).to be true
		end
	end


end