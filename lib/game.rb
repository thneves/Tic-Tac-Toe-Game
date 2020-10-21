class Game
  attr_accessor :spots, :winner, :draw, :board, :game_on, :player1, :player2
  def initialize
    @winner = false
    @draw = false
    @board = "\n[1] [2] [3]\n[4] [5] [6]\n[7] [8] [9]\n"
    @spots = %w[1 2 3 4 5 6 7 8 9]
    @game_on = true
    puts 'Enter name for the first player'
    name = gets.chomp
    @player1 = Player.new(name, 'x', 1)
    puts 'Enter name for the second player'
    name = gets.chomp
    @player2 = Player.new(name, 'o', 2)
    puts @board
  end
end
