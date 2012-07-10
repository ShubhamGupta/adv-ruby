class Example
	def self.create_example name, &body
		define_method name, body
	end
end
puts "Enter method name"
meth = gets
puts "Enter one line of code"
code = gets
a = Example.create_example("#{meth}") {eval code}
x = Example.new
x.send(meth.to_sym)
