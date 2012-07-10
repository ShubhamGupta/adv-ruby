require "rubygems"
require "redcloth"
class Formatter
	def initialize text
		@text = text
	end
end
class TextfileFormatter < Formatter
	def to_html
		RedCloth.new(@text).to_html
	end
end
a = TextfileFormatter.new "*strong*Coffee"
puts a.to_html
