# Loads source files for runner
require "./lib/game"
require "./lib/turn"
require "./lib/board"
require "./lib/ship"
require "./lib/cell"

# Loop to prompt user to either play the game or quit
# Restarts after each game concludes
loop do
  # Intro
  3.times { puts }

  puts "Welcome to BATTLESHIP\n\n"
  sleep(0.5)
  puts  "Enter p to play. Enter q to quit.!\n"\
        "------------------------------------------------------------------"

  # Establishes valid input options
  input = nil
  valid_input = ["P", "Q"]
  # Loop to prompt user for input until valid
  loop do
    input = gets.upcase.chomp
    break if valid_input.include?(input)

    puts "INVALID INPUT"
  end

  # Instantiates a new Game object, starts the game, and displays the winner at conclusion
  # Breaks loop if user inputs "Q"
  if input == "P"
    game = Game.new
    game.start
    puts game.winner
  else
    exit
  end
end
