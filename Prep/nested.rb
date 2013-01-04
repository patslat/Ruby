#nested.rb ch6 nested classes

class Drawing
	class Line
	end

	class Circle
		def what_am_i
			"This is a circle"
		end
	end

	def Drawing.give_me_a_circle
		Circle.new
	end
end

a = Drawing.give_me_a_circle
puts a.what_am_i
a = Drawing::Circle.new
puts a.what_am_i
a = Circle.new
puts a.what_am_i