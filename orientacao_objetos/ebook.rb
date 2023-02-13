require_relative 'product'

class Ebook
  include Product

  def initialize(title, price, year, publisher)
    @title = title
    @year = year
    @price = calc_price(price)
    @publisher = publisher
  end
  
  def type
    "ebook"
  end
  
  def matches?(query)
    ["ebook", "digital"].include?(query)
  end

end


