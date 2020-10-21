#!/usr/bin/env ruby

require '../lib/player.rb'
require '../lib/game.rb'

winner_cases = [%w[1 2 3], %w[4 5 6], %w[7 8 9], %w[1 4 7], %w[1 5 9], %w[2 5 8], %w[3 6 9], %w[3 5 7]]

game = Game.new

validator = false

while game.game_on

    if game.first_run
      puts 'Enter name for the first player'
      name = gets.chomp
      player1 = Player.new(name, 'x', 1)
      puts 'Enter name for the second player'
      name = gets.chomp
      player2 = Player.new(name, 'o', 2)
      
      puts game.board
      current_player = player1
      game.first_run = false
    end


  unless validator
    puts "#{current_player.name} YOUR TURN :"
    puts 'choose one available spot number in the board'
    player_input = gets.chomp
    current_player.add_mark(player_input)

    if game.spots.include?(player_input)
      game.spots.delete(player_input)
      validator = true
      game.board = game.board.gsub(player_input, current_player.symbol)
      puts game.board
    else
      puts 'Enter a valid spot number: '
      next
    end
  end

  validator = false

  if game.spots.empty?
    game.draw = true
    puts "NO ONE WINS! IT'S A DRAW!!"
  end

  winner_cases.each do |x|
    if (x - current_player.mark_spots).empty?
      game.winner = true
      puts "#{current_player.name} IS THE WINNER! CONGRATULATIONS"
    end
  end

  if current_player == player1
    current_player = player2
  elsif current_player == player2
    current_player = player1
  end

  game.game_on = false if game.winner == true || game.draw == true

  while game.game_on == false
    puts 'Do you wanna play again? (Y/N)'
    reset_game = gets.chomp.upcase
    choices = %w[Y N]
    until choices.include?(reset_game)
      puts "Digit 'Y' or 'N'"
      reset_game = gets.chomp.upcase
    end
    if reset_game == 'Y'
      game = Game.new
      current_player = player1
      game.first_run = true
    else
      puts 'THANKS FOR PLAYING!!'
    end

    break
  end
end
