require "./spec/spec_helper.rb"

3.times {puts}

puts "Welcome to BATTLESHIP\n\n"
sleep(0.5)
puts "Enter p to play. Enter q to quit.!
------------------------------------------------------------------"

input = gets.upcase.chomp
until input == "P" || input == "Q"
  puts "INVALID INPUT"
  input = gets.upcase.chomp
end

if input == "P"
  Game.new
else
  exit
end
