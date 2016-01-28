require 'product'

describe Product do

	describe "creating a product" do
		it 'new products are in stock by default' do
			product = Product.new("guitar", 5)
			expect(product.in_stock).to be true
		end

		it 'sets the name and price' do
			product = Product.new("guitar", 5)
			expect(product.title).to eq "guitar"
			expect(product.price).to eq 5
		end
	end
	
end