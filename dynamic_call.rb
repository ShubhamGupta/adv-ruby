class String
	def exclude? str
		!self.include? str
	end
	def to_str *a
		"hi"
	end
end

str = "abc"
puts "Enter the method to be invoked.(include? OR to_str)"
meth = gets.strip!
p str.send meth.to_sym, 'a'
