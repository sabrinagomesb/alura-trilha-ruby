class Ebook
  attr_reader :title, :price, :year, :publisher
  def initialize(title, price, year, publisher)
    @title = title
    @year = year
    @price = calc_price(price)
    @publisher = publisher
  end
  
  def type
    "ebook"
  end
  
  def to_csv
    "#{@title},#{@year},#{@price}"
  end

  def matches?(query)
    ["ebook", "digital"].include?(query)
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


