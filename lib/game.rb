class Game
  attr_accessor :spots, :winner, :draw, :board, :game_on, :first_run, :validator, :current_player
  attr_reader :winner_cases

  def initialize
    @winner = false
    @draw = false
    @validator = false
    @board = "\n[1] [2] [3]\n[4] [5] [6]\n[7] [8] [9]\n"
    @spots = %w[1 2 3 4 5 6 7 8 9]
    @winner_cases = [%w[1 2 3], %w[4 5 6], %w[7 8 9], %w[1 4 7], %w[1 5 9], %w[2 5 8], %w[3 6 9], %w[3 5 7]]
    @game_on = true
    @first_run = true
    @current_player = nil
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
      "\nNO ONE WINS! IT'S A DRAW!!"
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

  def change_player(player1, player2)
    if @current_player == player1
      @current_player = player2
    elsif current_player == player2
      @current_player = player1
    end
  end

  def reset_game(new_game, answer)
    if answer == 'Y'
      new_game = Game.new
      new_game
    elsif answer == 'N'
      'THANKS FOR PLAYING!'
    end
  end
end
