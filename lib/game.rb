class Game
  def initialize
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @human_board = Board.new

    computer_place(@computer_cruiser)
    computer_place(@computer_submarine)

    3.times {puts}
    sleep(1)
    puts "I have laid out my ships on the grid.\n"\
    "You now need to lay out your two ships.\n"\
    "The Cruiser is three units long and the Submarine is two units long.\n"

    human_place(@human_cruiser)
    human_place(@human_submarine)
    puts
    puts @human_board.render(true)
    puts
    # play
  end

  def computer_place(ship)
    sleep(1)
    three_cell_coordinates = [
    ["A1", "A2", "A3"],
    ["B1", "B2", "B3"],
    ["C1", "C2", "C3"],
    ["D1", "D2", "D3"],
    ["A2", "A3", "A4"],
    ["B2", "B3", "B4"],
    ["C2", "C3", "C4"],
    ["D2", "D3", "D4"],
    ["A1", "B1", "C1"],
    ["A2", "B2", "C2"],
    ["A3", "B3", "C3"],
    ["A4", "B4", "C4"],
    ["B1", "C1", "D1"],
    ["B2", "C2", "D2"],
    ["B3", "C3", "D3"],
    ["B4", "C4", "D4"],
    ]
    two_cell_coordinates = [
      ["A1", "A2"],
      ["B1", "B2"],
      ["C1", "C2"],
      ["D1", "D2"],
      ["A2", "A3"],
      ["B2", "B3"],
      ["C2", "C3"],
      ["D2", "D3"],
      ["A3", "A4"],
      ["B3", "B4"],
      ["C3", "C4"],
      ["D3", "D4"],
      ["A1", "B1"],
      ["A2", "B2"],
      ["A3", "B3"],
      ["A4", "B4"],
      ["B1", "C1"],
      ["B2", "C2"],
      ["B3", "C3"],
      ["B4", "C4"],
      ["C1", "D1"],
      ["C2", "D2"],
      ["C3", "D3"],
      ["C4", "D4"],
      ]
    coordinates = ship.length == 3 ? three_cell_coordinates.sample : two_cell_coordinates.sample
    until @computer_board.place(ship, coordinates) != false
      coordinates = ship.length == 3 ? three_cell_coordinates.sample : two_cell_coordinates.sample
    end

    puts @computer_board.render(true)
  end

  def human_place(ship)
    puts
    puts @human_board.render(true)
    print "\nEnter the squares for the #{ship.name} (#{ship.length} spaces): "
    coordinates = gets.chomp.split(" ")
    until @human_board.place(ship, coordinates) != false
      print "Those are invalid coordinates. Please try again: "
      coordinates = gets.chomp.split(" ")
    end
  end

  # def play
  #   start = Turn.new(@human_board, @computer_board)
  #   start.results
  # end
end