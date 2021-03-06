# exercise is to take a number of items in 3 shopping carts and to
# print out a receipt that lists the name of the item, price and tax
# then at the end print a total of price and of tax.
class Cart

	attr_reader :contents, :tax_total, :total

	def initialize
		@contents = []
		@tax_total = 0
		@total = 0
	end

	def add_contents(contents)
		@contents << contents
	end

	def receipt
		puts "Cart contains:"
			@contents.each do |item|
				print "1 #{item.name}:"
					if item.taxi != 0
						puts "#{(item.price.to_f + item.taxp.to_f + item.taxi.to_f).round(2)}"
					else 
						puts "#{(item.price.to_f + item.taxp.to_f).round(2)}"
					end
			end

		print "Sales Taxes: $"
			@contents.each {|item| @tax_total+=item.taxp}
				puts @tax_total.round(2)
			@contents.each {|item| @tax_total+=item.taxi}

		print "Total: $"
			@contents.each {|item| @total+=item.price}
		puts (@total + @tax_total).round(2)
	end
end

class Taxable

	attr_accessor :name, :price, :taxp, :taxi
	
	def initialize(name, price)
		@name = name.to_s
		@price = price.to_f
		@taxi = 0
	end

	def tax
		@taxp= (@price * 0.10).to_f
	end

end

class Exempt < Taxable

	def tax
		@taxp = (@price * 0).to_f
	end

end

class Import < Taxable

	def importtax
		@taxi = (@price * 0.05).to_f
	end

end

class Exempt_Import < Exempt

	def importtax
		@taxi = (@price * 0.05).to_f
	end
end


book = Exempt.new("book", 12.49)
book.tax

music_cd = Taxable.new("music cd", 14.99)
music_cd.tax

chocolate_bar = Exempt.new("chocolate bar", 0.85)
chocolate_bar.tax


cart1 = Cart.new
cart1.add_contents(book)
cart1.add_contents(music_cd)
cart1.add_contents(chocolate_bar)

cart1.receipt


cart2 = Cart.new
imp_chocs = Exempt_Import.new("Imported box of chocolates", 10.00)
imp_perf = Import.new("Imported bottle of perfume", 47.50)

imp_chocs.tax
imp_chocs.importtax
imp_perf.tax
imp_perf.importtax

cart2.add_contents(imp_chocs)
cart2.add_contents(imp_perf)

cart2.receipt

cart3 = Cart.new
imp_perf_two = Import.new("Imported bottle of perfume", 27.99)
perfume = Taxable.new("Bottle of perfume", 18.99)
pills = Exempt.new("Packet of headache pills", 9.75)
imp_chocs_two = Exempt_Import.new("Imported box of chocolates", 11.25)

imp_perf_two.tax
imp_perf_two.importtax
perfume.tax
pills.tax
imp_chocs_two.tax
imp_chocs_two.importtax

cart3.add_contents(imp_perf_two)
cart3.add_contents(perfume)
cart3.add_contents(pills)
cart3.add_contents(imp_chocs_two)

cart3.receipt