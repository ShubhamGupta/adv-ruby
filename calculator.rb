def cal op1, sym, op2
	op1.send sym, op2 if op1.respond_to? sym
end
puts cal 1,:*,2
