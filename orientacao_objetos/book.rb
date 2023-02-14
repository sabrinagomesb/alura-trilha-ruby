require_relative 'product'
require_relative 'printer'

class Book < Product
  attr_reader :has_reprint

  include Printer

  def initialize(title, price, year, publisher, has_reprint, has_cover)
    super(title, price, year, publisher)
    @has_reprint = has_reprint
    @has_cover = has_cover
  end

  def type
    "book"
  end

  def matches?(query)
    ["book", "printed"].include?(query)
  end
end
