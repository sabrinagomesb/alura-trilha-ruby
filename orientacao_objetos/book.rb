class Book
  attr_reader :title, :price, :year, :publisher, :has_reprint, :type
  def initialize(title, price, year, publisher, has_reprint, type)
    @title = title
    @year = year
    @has_reprint = has_reprint
    @price = calc_price(price)
    @publisher = publisher
    @type = type
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


