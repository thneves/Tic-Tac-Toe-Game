# frozen_string_literal: true

class Player
  attr_accessor :name, :symbol, :turn, :mark_spots
  def initialize(name, symbol, turn)
    @name = name
    @symbol = symbol
    @turn = turn
    @mark_spots =[]
  end

  def add_mark(mark)
    @mark_spots=@mark_spots.push(mark)
  end
end


winner_cases = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [1, 5, 9], [2, 5, 8], [3, 6, 9], [3, 5, 7]]
test_player= Player.new("Test_name", "o", 1)

test_player.add_mark(1)
print test_player.mark_spots
print "\n"
test_player.add_mark(2)
print test_player.mark_spots
test_player.add_mark(3)
print test_player.mark_spots
[1,2,3] indclue? [1,2,3] ---false

winner_cases.each  do |x| 
puts "winner!" if test_player.mark_spots.include?(x)
end  