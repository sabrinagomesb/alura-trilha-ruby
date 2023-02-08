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

class Stock
  attr_reader :books
  def initialize
    @books = []
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

  def add(book)
    @books << book if book
  end

end

stock = Stock.new

stock.add Book.new("Lógica de Programação", 50, 2009, true)
stock.add Book.new("Agile Web", 100, 1999, false)
stock.add Book.new("Ruby 7", 1000, 2023, true)
stock.add Book.new("Arquitetura", 100, 2004, true)

stock.add nil
stock.export_csv

cheap = stock.cheaper_than(50)
cheap.each do |book|
  puts book.title
end

