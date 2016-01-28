class Product

  attr_reader :title, :price
  attr_accessor :in_stock

  def initialize(title, price)
    @title = title.to_s
    @price = price.to_f.round(2)
    @in_stock = true
  end

  private 

  def in_stock?
    in_stock
  end

end