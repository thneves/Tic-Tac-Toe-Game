#!/usr/bin/env ruby

require '../lib/player.rb'

winner_cases = [%w[1 2 3], %w[4 5 6], %w[7 8 9], %w[1 4 7], %w[1 5 9], %w[2 5 8], %w[3 6 9], %w[3 5 7]]
winner = false
draw = false
board = "\n[1] [2] [3]\n[4] [5] [6]\n[7] [8] [9]\n"
spots = %w[1 2 3 4 5 6 7 8 9]
puts 'Enter name for the first player'
name = gets.chomp
player1 = Player.new(name, 'x', 1)
puts 'Enter name for the second player'
name = gets.chomp
player2 = Player.new(name, 'o', 2)

puts board

game_on = true

validator = false

current_player = player1

while game_on

  unless validator
    puts "#{current_player.name} YOUR TURN :"
    puts 'choose one available spot number in the board'
    player_input = gets.chomp
    current_player.add_mark(player_input)

    if spots.include?(player_input)
      spots.delete(player_input)
      validator = true
      board = board.gsub(player_input, current_player.symbol)
      puts board
    else
      puts 'Enter a valid spot number: '
      next
    end
  end

  validator = false

  draw = true if spots.empty?

  winner_cases.each do |x|
    winner = true if (x - current_player.mark_spots).empty?
  end

  if current_player == player1
    current_player = player2
  elsif current_player == player2
    current_player = player1
  end

  game_on = false if winner == true || draw == true

end
