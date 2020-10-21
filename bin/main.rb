#!/usr/bin/env ruby

# require '../lib/player.rb'

winner_cases = [%w[1 2 3], %w[4 5 6], %w[7 8 9], %w[1 4 7], %w[1 5 9], %w[2 5 8], %w[3 6 9], %w[3 5 7]]

winner = false
draw = false
board = "\n[1] [2] [3]\n[4] [5] [6]\n[7] [8] [9]\n"
spots = %w[1 2 3 4 5 6 7 8 9]
puts 'Enter name for the first player'
player1 = gets.chomp
puts 'Enter name for the second player'
name = gets.chomp
player2 = Player.new(name, 'o', 2)

game_on = true

game_on = true

validator = false

current_player = player1
mark = 'x'

while game_on

  unless validator
    puts "\n#{current_player.name} YOUR TURN :"
    puts 'choose one available spot number in the board'
    puts board
    player_input = gets.chomp
    current_player.add_mark(player_input)

    if spots.include?(player_input)
      spots.delete(player_input)
      validator = true
      board = board.gsub(player_input, current_player.symbol)

    else
      puts 'Enter a valid spot number: '
      next
    end
  end

  validator = false
  if spots.empty?
    draw = true
    puts "NO ONE WINS! IT'S A DRAW!!"
  end

  winner_cases.each do |x|
    if (x - current_player.mark_spots).empty?
      winner = true
      puts "#{current_player.name} IS THE WINNER! CONGRATULATIONS"
    end
  end

  if current_player == player1
    current_player = player2
    mark = 'o'
  elsif current_player == player2
    current_player = player1
    mark = 'x'
  end

  game_on = false if winner == true || draw == true

  while game_on == false
    puts 'Do you wanna play again? (Y/N)'
    reset_game = gets.chomp.upcase
    choices = %w[Y N]
    until choices.include?(reset_game)
      puts "Digit 'Y' or 'N'"
      reset_game = gets.chomp.upcase
    end
    break
  end

  if reset_game == 'Y'
    'we gonna reset'
  else
    puts 'THANKS FOR PLAYING!!'
  end

  while game_on == false
    puts 'Do you wanna play again? (Y/N)'
    reset_game = gets.chomp.upcase
    choices = %w[Y N]
    until choices.include?(reset_game)
      puts "Digit 'Y' or 'N'"
      reset_game = gets.chomp.upcase
    end
    if reset_game == 'Y'
      puts "We'll reset the game"
    else
      puts 'THANKS FOR PLAYING!!'
    end
    break
  end
end
