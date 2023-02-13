require_relative 'Product'

class Book
  attr_reader :has_reprint

  include Product

  def initialize(title, price, year, publisher, has_reprint, has_cover)
    @title = title
    @year = year
    @has_reprint = has_reprint
    @has_cover = has_cover
    @price = calc_price(price)
    @publisher = publisher
  end
  
  def has_reprint?
    @has_reprint
  end

  def type
    "book"
  end

  def matches?(query)
    ["book", "printed"].include?(query)
  end

end


