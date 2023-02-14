require_relative 'product'

class Ebook < Product
  def matches?(query)
    ["ebook", "digital"].include?(query)
  end
end
