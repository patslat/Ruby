#grandfatherClock.rb pine LearnToProgram

def grandfatherClock &block
	currentTime = Time.now.hour

	block.call

	while true
		if currentTime != Time.now.hour
			block.call
			currentTime = Time.now.hour
		end
	end
end

grandfatherClock do puts 'dong!' end
