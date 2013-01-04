#log.rb pine LearnToProgram
$nestingDepth = 0
def log descriptionOfBlock, &block
	
	puts "\t" * $nestingDepth + 'beginning '+descriptionOfBlock+' ...'

	$nestingDepth += 1 #next level
	a = block.call
	$nestingDepth -= 1 #back to previous level upon completion

	puts "\t" * $nestingDepth + descriptionOfBlock+' finished, returning: ' + a.to_s

end

log 'outer block' do
	log 'some little block' do
		5 
	end

	log 'yet another block' do
		'I like Thai food!'
	end

	false
	
end

puts 'try another'

log 'outer block' do
	log 'depth is 1, lets go deeper' do
		log 'depth is 2' do
			log 'depth is three!' do
				log 'depth is four!!!' do
					'this is the center of the universe'
				end
				'beginning the ascent'
			end
			'back at level 2'
		end
		'back to level 1, almost home'
	end
	'we are now exiting the outer block'
end
