require "./spec/spec_helper.rb"

3.times {puts}

puts "Welcome to BATTLESHIP\n\n"
sleep(0.5)
puts "Enter p to play. Enter q to quit.!
------------------------------------------------------------------"

input = nil
loop do
  input = gets.upcase.chomp
  break if input == "P" || input == "Q"
  puts "INVALID INPUT"
end

input == "P" ? game = Game.new : exit

puts game.winner