#!/usr/bin/env ruby

require '../lib/player.rb'

winner_cases = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [1, 5, 9], [2, 5, 8], [3, 6, 9], [3, 5, 7]]
winner = false
draw = false

spots = %w[1 2 3 4 5 6 7 8 9]
puts 'Enter name for the first player'
name = gets.chomp
player1 = Player.new(name, 'x', 1)
puts 'Enter name for the second player'
name = gets.chomp
player2 = Player.new(name, 'o', 2)

board = "\n[1] [2] [3]\n[4] [5] [6]\n[7] [8] [9]\n"

puts board

validator = false

current_player = player1

while winner == false || draw == false

  unless validator
    puts "(#{current_player.name}) choose your move :"
    player_input = gets.chomp

    if spots.include?(player_input)
      spots.delete(player_input)
      validator = true
      print spots
      board = board.gsub(player_input, current_player.symbol)
      puts board
    else
      puts 'Enter a valid spot number: '
      next
    end
  end

  if current_player == player1
    current_player = player2
  elsif current_player == player2
    current_player = player1
  end

  validator = false

  draw = true if spots.empty?

  winner_cases.each do |x|
    winner = true if (x - current_player.mark_spots).empty?
  end
end
