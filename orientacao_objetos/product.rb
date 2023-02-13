module Product

  attr_reader :title, :price, :year, :publisher

  def to_csv
    "#{@title},#{@year},#{@price}"
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