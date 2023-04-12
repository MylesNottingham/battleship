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

    display_boards
    human_shot
    computer_shot
    display_results
    determine_winner
  end

  def display_boards
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render

    puts "==============PLAYER BOARD=============="
    puts @human_board.render(true)
    puts
  end

  # def human_shot
  #   input = gets.chomp
  #   while @computer_board.cells[input].fired_upon?
  #     puts "Already fired upon"
  #     input = gets.chomp
  #   end
  #   @computer_board.cells[input].fire_upon
  # end

  def human_shot
    @human_shot = nil

    puts "Enter the coordinate for your shot: "
    loop do
      @human_shot = gets.chomp
      break if @computer_board.valid_coordinate?(@human_shot) && !@computer_board.cells[@human_shot].fired_upon?
      puts "Please enter a valid coordinate: "
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
    @computer_board.cells[@human_shot].status == "M" ? human_result = "miss" : human_result = "hit"
    puts "Your shot on #{@human_shot} was a #{human_result}."
    @human_board.cells[@computer_shot].status == "M" ? computer_result = "miss" : computer_result = "hit"
    puts "My shot on #{@computer_shot} was a #{computer_result}."
  end

  def determine_winner
    @turn_winner = "TEST"
  end
end
