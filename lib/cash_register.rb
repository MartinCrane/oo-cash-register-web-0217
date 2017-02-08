require "pry"

class CashRegister

	attr_accessor :total
	attr_accessor :discount
	
	
	def initialize(discount = nil)
		
		@total = 0
		@discount = discount
		@items = []
	end

	def add_item(title, price, number_of_items = nil)
		
		#these are a record of the last transaction easily available to void
		@stored_last_item = title
		@stored_last_price = price
		@stored_last_quantity = number_of_items
		

		if number_of_items != nil
			i = number_of_items
			while (i > 0)
				@items.push(title)
				i -= 1
			end
			price = number_of_items * price

		else

			@items.push(title)

		end

		
		self.total = self.total + price
	end

	def items
		@items
	end


	def apply_discount
		
		if self.discount != nil
			self.total = self.total - ((self.discount.to_f/100)*self.total)
			puts "After the discount, the total comes to $#{self.total.truncate}."
			"After the discount, the total comes to $#{self.total.truncate}."
		else
			puts "There is no discount to apply."
			"There is no discount to apply."
		end 
	end

	def void_last_transaction

		if @stored_last_quantity != nil
			self.total = self.total - (@stored_last_price * @stored_last_quantity)
			@items.pop(@stored_last_quantity)
			self.total
		else
			self.total = self.total - @stored_last_price
		end
	end


end


# class Person
 
#   attr_accessor :age
 
#   def initialize(weight, age = nil)
#     @weight = weight
#     @age = age
#   end
 
#   def birthday
#     self.age += 1
#   end
# end

