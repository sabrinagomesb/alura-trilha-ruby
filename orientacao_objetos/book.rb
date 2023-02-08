class Book
  attr_reader :title, :price, :year
  def initialize(title, price, year)
    @title = title
    @year = year
    @price = calc_price(price)
  end

  private

  def calc_price(base)
    if @year < 2000
      base * 0.7
    else
      base
    end   
  end
end

book_rails = Book.new("Agile Web", 70, 1999)
puts "Title: #{book_rails.title} - #{book_rails.price}, #{book_rails.year}"