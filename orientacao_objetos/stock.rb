require_relative "count"

class Stock
  attr_reader :books
  def initialize
    @books = []
    @sales = []
    @books.extend Count
  end

  def method_missing(name)
    matcher = name.to_s.match "(.+)_best_seller_by_(.+)"
    if matcher
      type = matcher[1]
      field = matcher[2].to_sym
      best_seller_by(type, &field)
    else
      super
    end
  end

  def respond_to?(name)
    matched = name.to_s.match( "(.+)_best_seller_by_(.+)")
    !!(matched) || super
  end

  def export_csv
    @books.each do |book|
      puts book.to_csv
    end
  end
  
  def cheaper_than(ref_price)
    @books.select do |book|
      book.price <= ref_price
    end
  end

  def total
    @books.size
  end

  def <<(book)
    @books << book if book
    self
  end

  def sale(book)
    @books.delete book
    @sales << book
  end

  def max_need
    @books.max_need
  end

  private
  def sales_amount_by_title(product, &field)
    @sales.count { |sale| field.call(sale) == field.call(product)}
  end

  def best_seller_by(type, &field)
    @sales.select { |product| product.matches?(type)} .sort { | sale1, sale2 |
      sales_amount_by_title(sale1, &field) <=>
      sales_amount_by_title(sale2, &field)
    }.last
  end
end