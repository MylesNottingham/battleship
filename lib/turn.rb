class Turn
  attr_reader :turn_winner

  def initialize(
    computer_cruiser,
    computer_submarine,
    human_cruiser,
    human_submarine,
    computer_board,
    human_board
  )
    @computer_cruiser = computer_cruiser
    @computer_submarine = computer_submarine
    @human_cruiser = human_cruiser
    @human_submarine = human_submarine
    @computer_board = computer_board
    @human_board = human_board
    @turn_winner = nil
  end

  def start
    display_boards
    human_shot
    computer_shot
    display_results
    determine_winner
  end

  def display_boards
    puts  "=============COMPUTER BOARD=============\n"\
          "#{@computer_board.render}"\
          "==============PLAYER BOARD==============\n"\
          "#{@human_board.render(true)}"
  end

  def human_shot
    @human_shot = nil

    print "Enter the coordinate for your shot: "
    loop do
      @human_shot = gets.chomp
      break if @computer_board.valid_coordinate?(@human_shot) && !@computer_board.cells[@human_shot].fired_upon?

      print "Please enter a valid coordinate: "
    end

    @computer_board.cells[@human_shot].fire_upon
  end

  def computer_shot
    loop do
      @computer_shot = @human_board.cells.keys.sample
      break unless @human_board.cells[@computer_shot].fired_upon?
    end
    @human_board.cells[@computer_shot].fire_upon
  end

  def display_results
    sleep(1)
    human_result = @computer_board.cells[@human_shot].status == "M" ? "miss" : "hit"
    puts "\n\nYour shot on #{@human_shot} was a #{human_result}."
    sleep(1)
    computer_result = @human_board.cells[@computer_shot].status == "M" ? "miss" : "hit"
    puts "\nMy shot on #{@computer_shot} was a #{computer_result}.\n\n"
    sleep(1)
  end

  def determine_winner
    if @computer_cruiser.sunk? && @computer_submarine.sunk? && @human_cruiser.sunk? && @human_submarine.sunk?
      display_boards
      @turn_winner = "Draw!"
    elsif @computer_cruiser.sunk? && @computer_submarine.sunk?
      display_boards
      @turn_winner = "You won!"
    elsif @human_cruiser.sunk? && @human_submarine.sunk?
      display_boards
      @turn_winner = "I won!"
    else
      @turn_winner = nil
    end
  end
end
