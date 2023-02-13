require_relative 'product'

class Magazine
  attr_reader :has_reprint, :number

  include Product

  def initialize(title, price, year, publisher, has_reprint, number)
    @title = title
    @year = year
    @has_reprint = has_reprint
    @price = calc_price(price)
    @publisher = publisher
    @number = number
  end
  
  def has_reprint?
    @has_reprint
  end

  def type
    "mag"
  end

  def matches?(query)
    ["mag", "printed"].include?(query)
  end
end


