class Product

  attr_reader :title, :in_stock

  def initialize(title)
    @title = title
    @in_stock = true
  end

  private 

  def in_stock?
    in_stock
  end

end