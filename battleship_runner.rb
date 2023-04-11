require "./lib/game"
require "./lib/board"
require "./lib/ship"
require "./lib/cell"

game = Game.new
3.times { puts }

puts "Welcome to BATTLESHIP\n\n"
sleep(0.5)
puts "Enter p to play. Enter q to quit.!
------------------------------------------------------------------"

input = nil
valid_input = ["P", "Q"]
loop do
  input = gets.upcase.chomp
  break if valid_input.include?(input)

  puts "INVALID INPUT"
end

input == "P" ? game.play : exit

puts game.winner
