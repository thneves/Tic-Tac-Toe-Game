class Game
  attr_accessor :spots, :winner, :draw, :board
  def initialize
    @winner = false
    @draw = false
    @board = "\n[1] [2] [3]\n[4] [5] [6]\n[7] [8] [9]\n"
    @spots = %w[1 2 3 4 5 6 7 8 9]
  end
end
