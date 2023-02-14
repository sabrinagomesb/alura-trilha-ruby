require_relative 'product'

class Magazine < Product
  attr_reader :has_reprint, :number

  include Printer

  def initialize(title, price, year, publisher, has_reprint, number)
    super(title, price, year, publisher)
    @has_reprint = has_reprint
    @number = number
  end
  
  def type
    "mag"
  end

  def matches?(query)
    ["mag", "printed"].include?(query)
  end
end
