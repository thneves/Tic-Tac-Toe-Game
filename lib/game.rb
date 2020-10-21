class Game
  attr_accessor :spots, :winner, :draw, :board, :game_on, :first_run, :validator, :winner_cases, :continue
  def initialize
    @winner = false
    @draw = false
    @validator = false
    @board = "\n[1] [2] [3]\n[4] [5] [6]\n[7] [8] [9]\n"
    @spots = %w[1 2 3 4 5 6 7 8 9]
    @winner_cases = [%w[1 2 3], %w[4 5 6], %w[7 8 9], %w[1 4 7], %w[1 5 9], %w[2 5 8], %w[3 6 9], %w[3 5 7]]
    @game_on = true
    @first_run = true
  end

  def update_board(input, sym)
    if @spots.include?(input)
      @spots.delete(input)
      @validator = true
      @board = @board.gsub(input, sym)
      true
    else
      false
    end
  end

  def draw_message
    if @spots.empty?
      @draw = true
      "\n NO ONE WINS! IT'S A DRAW!!"
    else
      ''
    end
  end

  def winner_message(current_player)
    @winner_cases.each do |x|
      next unless (x - current_player.mark_spots).empty?

      @winner = true
      @draw = false
      return "#{current_player.name} IS THE WINNER! CONGRATULATIONS"
    end
    ''
  end
end
