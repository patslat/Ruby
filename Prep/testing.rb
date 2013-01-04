#testing.rb ch8

class String
	def titleize
		self.gsub(/(\A|\s)\w/) { |letter| letter.upcase}
	end
end

puts "this is a test".titleize
=begin
raise "Fail 1" unless "this is a test".titleize == "This Is A Test"
raise "Fail 2" unless "another test 1234".titleize == "Another Test 1234"
raise "Fail 3" unless "We're testing titleize".titleize == "We're Testing Titleize"
=end
require 'test/unit'

class TestTitleize < Test::Unit::TestCase
	def test_basic
		assert_equal("This Is A Test", "this is a test".titleize)
		assert_equal("Another Test 1234", "another test 1234".titleize)
		assert_equal("We're Testing", "We're testing".titleize)
	end
end

