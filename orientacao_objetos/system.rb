require_relative "book"
require_relative "ebook"
require_relative "magazine"
require_relative "stock"

stock = Stock.new

logic = Book.new("Lógica de Programação", 50, 2009, "Uno", true, true)
agile = Book.new("Agile Web", 100, 1999, "Uno", false, false)
ruby = Book.new("Ruby 7", 1000, 2023, "Five", true, false)
arch = Book.new("Arquitetura", 100, 2004, "Six", true, false)
online_arch = Ebook.new("Arquitetura", 5000, 2004, "Six")
#  :title, :price, :year, :publisher, :has_reprint, :number
mag_ruby = Magazine.new("Magazine Ruby", 15, 2012, "Capricho", true, 1)

stock.books << agile << ruby << arch << agile << ruby << arch << agile << ruby << arch << logic << logic << ruby << mag_ruby << mag_ruby << online_arch

stock.sale online_arch
stock.sale logic
stock.sale logic
stock.sale agile
stock.sale agile
stock.sale ruby
stock.sale ruby
stock.sale ruby
stock.sale arch
stock.sale mag_ruby
stock.sale mag_ruby

puts "- Ebook mais vendido:"
puts stock.ebook_best_seller_by_title.title
puts "- Livro mais vendido:"
puts stock.book_best_seller_by_title.title
puts "- Revista mais vendido:"
puts stock.mag_best_seller_by_title.title

# stock.export_csv
cheap = stock.cheaper_than(50)
cheap.each do |book|
  puts "Livro mais barato:"
  puts book.title
end
