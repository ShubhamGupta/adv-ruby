module A
	module X
		def me
			p "hell"
		end
	end
	def self.included klass
		klass.extend X
	end
	def S
		p 'called s'
	end
end

class B
	include A
end
B.new.S
B.me
