class Turn 
  attr_reader :winner

  def initialize(computer_board, human_board)
    @computer_board = computer_board
    @human_board = human_board
    @turn_winner = nil

  end

  def display_boards
    # will just call render for both boards
  end

  def human_shot
    # prompt for coordinate with a loop that only allows for valid_coordinates
  end

  def computer_shot
    # automatically choose a valid coordinate
  end

  def results
    # print results
  end

  def determine_winner
    @winner = @turn_winner
  end

end