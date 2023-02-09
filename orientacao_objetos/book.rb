class Book
  attr_reader :title, :price, :year, :has_reprint
  def initialize(title, price, year, has_reprint)
    @title = title
    @year = year
    @has_reprint = has_reprint
    @price = calc_price(price)
  end
  
  def to_csv
    "#{@title},#{@year},#{@price}"
  end

  def has_reprint?
    @has_reprint
  end

  private
  def calc_price(price_base)
    if @year < 2006
      if @has_reprint
        price_base * 0.9
      else
        price_base * 0.95
      end
    elsif @year <= 2010
      price_base * 0.96
    else
      price_base
    end
  end
end

module Count
  def <<(item)
    push(item)
    if @max_need.nil? || @max_need < size
        @max_need = size
    end
    self
  end
  def max_need
    @max_need
  end
end

class Stock
  attr_reader :books
  def initialize
    @books = []
    @books.extend Count
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

  def remove(book)
    @books.delete book
  end

  def max_need
    @books.max_need
  end
end

stock = Stock.new

stock.add Book.new("Lógica de Programação", 50, 2009, true)
agile = Book.new("Agile Web", 100, 1999, false)
ruby = Book.new("Ruby 7", 1000, 2023, true)
arch = Book.new("Arquitetura", 100, 2004, true)

stock.books << agile << ruby << arch
puts stock.books.max_need

numbers = []
numbers.extend Count
numbers << 13 << 15 << 17 << 19 << 21
puts numbers.max_need

# stock.export_csv

cheap = stock.cheaper_than(50)
cheap.each do |book|
  puts book.title
end

