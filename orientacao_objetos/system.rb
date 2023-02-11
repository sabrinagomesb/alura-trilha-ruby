require_relative "book"
require_relative "stock"

stock = Stock.new

logic = Book.new("Lógica de Programação", 50, 2009, "Uno", true, "book")
agile = Book.new("Agile Web", 100, 1999, "Uno", false, "book")
ruby = Book.new("Ruby 7", 1000, 2023, "Five", true, "book")
arch = Book.new("Arquitetura", 100, 2004, "Six", true, "book")
mag_ruby = Book.new("Magazine Ruby", 15, 2012, "Ten", true, "mag")

stock.books << agile << ruby << arch << agile << ruby << arch << agile << ruby << arch << logic << logic << ruby << mag_ruby << mag_ruby
stock.sale logic
stock.sale logic
stock.sale agile
stock.sale agile
stock.sale ruby
stock.sale ruby
stock.sale ruby
stock.sale arch
stock.sale mag_ruby

puts "Livro mais vendido:"
puts stock.book_best_seller_by_title.title
puts "Ano que mais vendeu:"
puts stock.book_best_seller_by_year.year
puts "Editora que mais vendeu:"
puts stock.book_best_seller_by_publisher.publisher
puts "Revista mais vendida:"
puts stock.mag_best_seller_by_title.title



# stock.export_csv
cheap = stock.cheaper_than(50)
cheap.each do |book|
  puts "Livro mais barato:"
  puts book.title
end
