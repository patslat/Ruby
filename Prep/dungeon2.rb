#dungeon2.rb round 2 ch6

class Dungeon
	attr_accessor :player

	def initialize(player_name)
		@player = Player.new(player_name)
		@rooms = []
	end

	Player = Struct.new(:name, :location)
	Room = Struct.new(:reference, :name, :description, :connections)
end

#shorter, and since you used Struct Player.new(player_name) without
#location still works, just leaves @location = nil
#if you need to add methods to Player or Room you can rewrite them as
#classes and add the attributes with attr_accessor

class Dungeon #add a way to create rooms
	def add_room(reference, name, description, connections)
		@rooms << Room.new(reference, name, description, connections)
	end
end

my_dungeon = Dungeon.new("Derpus")
puts my_dungeon.player.name

my_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave", {:west => :smallcave })

my_dungeon.add_room(:smallcave, "Small Cave", "a small, claustrophobic cave", {:east => :largecave})

#navigation!
class Dungeon
	def start(location)
		@player.location = location
		show_current_description
	end

	def show_current_description
		puts find_room_in_dungeon(@player.location).full_description
	end

	def find_room_in_dungeon(reference)
		@rooms.detect {|room| room.reference == reference }
	end

	class Room
		def full_description
			@name + "\n\nYou are in " + @description
		end
	end
end

