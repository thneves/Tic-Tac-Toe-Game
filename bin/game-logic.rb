class Player
  attr_accessor :name, :turn
  @@turn = 0
  def initialize
    @turn = @@turn+=1
    puts "Enter the name for player #{@turn}"
    @name = gets.chomp
  end
end

player1 = Player.new
player2 = Player.new

puts player1.name
puts player1.turn
puts player2.name
puts player2.turn