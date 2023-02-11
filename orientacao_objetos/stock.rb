require_relative "count"

class Stock
  attr_reader :books
  def initialize
    @books = []
    @sales = []
    @books.extend Count
  end

  def sales_amount_by_title(product, &field)
    @sales.count { |sale| field.call(sale) == field.call(product)}
  end

  def best_seller_by(type, &field)
    @sales.select { |l| l.type == type} .sort { | sale1, sale2 |
      sales_amount_by_title(sale1, &field) <=>
      sales_amount_by_title(sale2, &field)
    }.last
  end

  def mag_best_seller_by_title
    best_seller_by("mag", &:title)
  end

  def book_best_seller_by_title
    best_seller_by("book", &:title)
  end

  def book_best_seller_by_year
    best_seller_by("book", &:year)
  end

  def book_best_seller_by_publisher
    best_seller_by("book", &:publisher)
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
end