#22westall.rb

class House
	attr_accessor :player

	def initialize(player_name)
		@player = Player.new(player_name)
		@rooms = []
	end

	def add_room(reference, name, description, connections)
		@rooms << Room.new(reference, name, description, connections)
	end

	def start(location)
		@player.location = location
		show_current_description
	end

	def show_current_description
		puts find_room_in_house(@player.location).full_description
	end

	def find_room_in_house(reference)
		@rooms.detect { |room| room.reference == reference }
	end

	def find_room_in_direction(direction)
		find_room_in_house(@player.location).connections[direction]
	end

	def go(direction)
		if check_if_valid(direction)
			puts "You go " + direction.to_s
			@player.location = find_room_in_direction(direction)
			show_current_description
		else
			puts "You bump into a wall, try again."
		end
	end


	def check_if_valid(direction)
		if find_room_in_house(@player.location).connections[direction]
			true
		else 
			false
		end
	end



	class Player
		attr_accessor :name, :location

		def initialize(name)
			@name = name
		end
	end

	class Room
		attr_accessor :reference, :name, :description, :connections

		def initialize(reference, name, description, connections)
			@reference = reference
			@name = name
			@description = description
			@connections = connections
		end

		def full_description
			@name + "\n\nYou are in " + @description
		end
	end

end

#create house object
my_house = House.new("Annak")

#add rooms
my_house.add_room(:eastlivingroom, "East Living Room", "a living room with your back to the front door. In front of you is a dining table. There are many trinkets and photographs. The occupants appear to be well traveled. The room extends to the west, there is a door to the north, and there is a kitchen to the east.",
	{ :north => :bedroom, :east => :kitchen, :west => :westlivingroom} )

my_house.add_room(:westlivingroom, "West Living Room", "the western portion of the living room. There is a couch to your left and a high ranking hamster official in the corner. There are freshly brewed cups of tea on the coffee table. There is a Klimt painting on the wall. The room extends to the east and there is a door to the north.", 
	{:north => :bathroom, :east => :eastlivingroom} )

my_house.add_room(:bathroom, "Bathroom", "the bathroom. There are normal bathroom things. You are standing on a purple rug and looking at fish that are swimming across a shower curtain. The exit is to the south",
	{:south => :westlivingroom} )

my_house.add_room(:kitchen, "Kitchen", "the kitchen. It looks well used and the sink is full of dishes. There is a small window that looks out to the world. There is a cork board with pictures of a couple that is very much in love. The refrigerator is well stocked with fresh greens. The living room is to the west.",
	{:west => :eastlivingroom} )

my_house.add_room(:bedroom, "Bedroom", "the bedroom. Behind a large bed is a beautiful tapestry from a foreign land. It is illuminated by lights hanging from the wall. Clothes are scattered across the floor and a heater is keeping the room warm and toasty. Sunlight is pouring through the large window on the northern wall. There is a door in the western corner, as well as the door to the living room to the south.", 
	{:west => :closet, :south => :eastlivingroom} )

my_house.add_room(:closet, "Closet", "the closet. It's a cramped room that is filled with storage containers and clothing. There appears to be something mysterious buried in the corner. The exit is back to the east.",
	{:east => :bedroom} )

my_house.start(:eastlivingroom)


puts "Which way would you like to go (north, south, east, west)?"
input = gets.chomp.to_sym

while input != nil
	my_house.go(input)
	puts "Which way would you like to go (north, south, east, west)?"
	input = gets.chomp.to_sym
end

System.exit(0)
	