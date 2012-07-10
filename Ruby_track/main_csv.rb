require "csv"

class CsvReader
	attr_reader :reader, :file_name
	def initialize file_name
		@reader = CSV.read file_name, :headers => true
		@file_name = file_name
	end
	
	def self.create_class(class_name, superclass, &block)
		klass = Class.new superclass, &block
#		Object.const_set class_name.capitalize, klass
	end
	#make_class creates a class from a CsvReader object
	def make_class
			file_name = self.file_name
			CsvReader.create_class(self.file_name, Object) do
			csv_file = CsvReader.new file_name
			class << self
				attr_accessor :headers
			end
			self.headers = csv_file.reader.headers
			#creating instance variables of newly created class from headers
			self.headers.each do |head|
				attr_accessor head.to_sym
			end
			#this initialize belongs to the newly created class
			def initialize row
				count = -1
				self.class.headers.each { |head| self.send (head+'='), row[count += 1]}
			end
		end
	end
end

csv_file = CsvReader.new 'data'
klass = csv_file.make_class
csv_file.reader.each do |row|
	obj = klass.new row.fields #each object corresponds to a row in csv file
	p obj.name
end
