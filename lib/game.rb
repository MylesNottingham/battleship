class Game
  attr_reader :computer_cruiser,
              :computer_submarine,
              :human_cruiser,
              :human_submarine,
              :computer_board,
              :human_board,
              :winner

  def initialize
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @human_board = Board.new
    @winner = nil
  end

  def start
    computer_place(@computer_cruiser)
    computer_place(@computer_submarine)

    3.times { puts }
    sleep(1)
    puts "I have laid out my ships on the grid.\n"\
    "You now need to lay out your two ships.\n"\
    "The Cruiser is three units long and the Submarine is two units long.\n"

    human_place(@human_cruiser)
    human_place(@human_submarine)
    puts
    puts @human_board.render(true)
    puts
    play
  end

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
      turn.start_turn
      @winner = turn.turn_winner
    end
  end

  def computer_place(ship)
    sleep(1)
    loop do
      coordinates = ship.length == 3 ? three_cell_coordinates.sample : two_cell_coordinates.sample
      break if @computer_board.place(ship, coordinates)
    end
  end

  def human_place(ship)
    puts
    puts @human_board.render(true)
    loop do
      print "Enter the squares for the #{ship.name} (#{ship.length} spaces): "
      coordinates = gets.chomp.split(" ")
      break if @human_board.place(ship, coordinates)

      puts "Those are invalid coordinates. Please try again."
    end
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
