# Establishes Game class
class Game
  attr_reader :computer_cruiser,
              :computer_submarine,
              :human_cruiser,
              :human_submarine,
              :computer_board,
              :human_board,
              :winner

  # Instantiates with four ships, two boards and no winner
  def initialize
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @human_board = Board.new
    @winner = nil
  end

  # Starts functionality of the game
  def start
    # Places computer and human ships
    computer_place(@computer_cruiser)
    computer_place(@computer_submarine)

    # Waits one second to display the string provided
    puts
    sleep(1)
    puts "I have laid out my ships on the grid.\n"\
    "You now need to lay out your two ships.\n"\
    "The Cruiser is three units long and the Submarine is two units long.\n"

    # Gets input from human, places ships, shows the human board and calls play method
    human_place(@human_cruiser)
    human_place(@human_submarine)
    puts "\n#{@human_board.render(true)}"
    play
  end

  # Loops until winner is true
  # Intantiates a new turn with board instance objects ("bootleg inheritence")
  # Begins a turn by calling start
  def play
    until @winner
      turn = Turn.new(
        @computer_cruiser,
        @computer_submarine,
        @human_cruiser,
        @human_submarine,
        @computer_board,
        @human_board
      )
      turn.start
      @winner = turn.turn_winner
    end
  end

  # Places both computer ships after assessing ship length
  def computer_place(ship)
    loop do
      coordinates = ship.length == 3 ? three_cell_coordinates.sample : two_cell_coordinates.sample
      break if @computer_board.place(ship, coordinates)
    end
    sleep(1)
  end

  # Places human ships after accounting for human error
  # Prints strings to interact with user 
  def human_place(ship)
    puts "\n#{@human_board.render(true)}"
    loop do
      print "Enter the squares for the #{ship.name} (#{ship.length} spaces): "
      coordinates = gets.chomp.split(" ")
      break if @human_board.place(ship, coordinates)

      puts "Those are invalid coordinates. Please try again."
    end
    sleep(1)
  end

  def three_cell_coordinates
    three_cell_coordinates = []
    ("A".."D").each do |letter|
      (1..2).each do |number|
        three_cell_coordinates << ["#{letter}#{number}", "#{letter}#{number + 1}", "#{letter}#{number + 2}"]
      end
    end
    (1..4).each do |number|
      ("A".."B").each do |letter|
        three_cell_coordinates << ["#{letter}#{number}", "#{letter.next}#{number}", "#{letter.next.next}#{number}"]
      end
    end
    three_cell_coordinates
  end

  def two_cell_coordinates
    two_cell_coordinates = []
    ("A".."D").each do |letter|
      (1..3).each do |number|
        two_cell_coordinates << ["#{letter}#{number}", "#{letter}#{number + 1}"]
      end
    end
    (1..4).each do |number|
      ("A".."C").each do |letter|
        two_cell_coordinates << ["#{letter}#{number}", "#{letter.next}#{number}"]
      end
    end
    two_cell_coordinates
  end
end
