#polymorphism.rb

class Animal
	attr_accessor :name

	def initialize(name)
		@name = name #define instance variable called name
	end
end

class Cat < Animal # define a class that inherits from Animal class
	def talk
		"Meaow!"
	end
end

class Dog < Animal
	def talk
		"Woof!"
	end
end

animals = [Cat.new("Flossie"), Dog.new("Clive"), Cat.new("Max")]
animals.each do |animal|
	puts animal.talk
end
