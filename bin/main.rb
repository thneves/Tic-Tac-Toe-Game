# #!/usr/bin/env ruby

#puts "Hello World!"

winner = false
draw = false
validator = false
spots = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
puts "Enter name for the first player"
player1 = "player1" 
puts "Enter name for the second player"
player2 = "player2"

board = "\n[1] [2] [3]\n[4] [5] [6]\n[7] [8] [9]\n"

puts board 

while winner == false || draw == false

  unless  validator
   
    puts "(#{player1}) choose your move :"
    p1 = gets.chomp
    if spots.include?(p1) 
    spots.delete(p1)
    validator = true
    print spots
    board = board.gsub(p1, "x")
 puts board

    else 
    #validator = true if p1 == /[1-9]/
    puts "Enter a valid spot number: "
    end
  end
validator = false
  unless  validator
    puts "(#{player2}) choose your move :"
    p2 = gets.chomp
    if spots.include?(p2) 
    spots.delete(p2)
    validator = true
    print spots
    board = board.gsub(p2, "o")
 puts board

    else 
    #validator = true if p1 == /[1-9]/
    puts "Enter a valid spot number: "
    end
  end



validator= false

end