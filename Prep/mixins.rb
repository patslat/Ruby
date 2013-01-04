# mixins.rb Ch6 Mix-Ins

# Ruby doesn't support multiple inheritance, the ability to inherit from multiple classes at the same time

module UsefulFeatures
	def class_name
		self.class.to_s
	end
end

class Person
	include UsefulFeatures
end

module AnotherModule
	def do_stuff
		puts "This is a test"
	end
end

include AnotherModule
do_stuff

x = Person.new
puts x.class_name

