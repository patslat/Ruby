# person.rb example of OOP

class Person
	def initialize(name, age)
		set_name(name)
		@age = age
	end

	def age
		@age
	end

	def how_old?
		puts self.age
	end


	def age_difference_with(other_person)
		(self.age - other_person.age).abs
	end

	protected	:age

	def name
		@first_name + ' ' + @last_name
	end

	def set_name(name)
		first_name, last_name = name.split(/\s+/)
		set_first_name(first_name)
		set_last_name(last_name)
	end

	def set_first_name(name)
		@first_name = name
	end

	def set_last_name(name)
		@last_name = name
	end

	private :set_name, :set_first_name, :set_last_name
end

fred = Person.new("Fred derpus", 34)
derpstein = Person.new("derpus derpstein", 48)

puts fred.name
puts fred.age_difference_with(derpstein)
puts fred.how_old?

puts derpstein.age