require 'product'

describe Product do

	let(:product) { Product.new("guitar", 5) }

	describe "creating a product" do
		it 'new products are in stock by default' do
			expect(product.in_stock).to be true
		end

		it 'sets the name and price' do
			expect(product.title).to eq "guitar"
			expect(product.price).to eq 5.00
		end
	end

	describe 

end