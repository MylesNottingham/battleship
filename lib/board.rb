class Board
  attr_reader :cells

  def initialize
    create_cells
  end

  # Creates 16 new cells based on a range from A to D
  # Iterates over new range and adds consecutive numbers to each letter
  def create_cells
    @cells = {}
    ("A".."D").each do |letter|
      4.times do |index|
        cell = "#{letter}#{index + 1}"
        @cells[cell] = Cell.new(cell)
      end
    end
  end

  # Places ship on board after validating coordinates and ship input
  # Adjusts the cell status of valid cordinates to represent a ship
  def place(ship, coordinates)
    return false unless valid_coordinates?(coordinates) && valid_placement?(ship, coordinates)

    coordinates.each { |coordinate| @cells[coordinate].place_ship(ship) }
  end

  # Returns the board as a string to display on command line
  def render(reveal = false)
    # Break cells into rows of four and add to rows array
    rows = []
    @cells.values.each_slice(4) { |cells| rows << cells }

    # Create the header line with column numbers
    columns = (1..(rows.count)).to_a.join(" ")

    # Create board by starting with the ordinal value of the letter "A", indexing up a letter for each row
    # Then we map out the status of each cell and reveal ship placement if "reveal" is true
    # All of this is shoveled into the "board_array"
    board_array = []
    rows.each_with_index do |row, index|
      board_array << "#{(65 + index).chr} #{row.map { |cell| cell.render(reveal) }.join(' ')} \n"
    end

    # This formats our "columns" header and our "board_array" together as one string
    "  #{columns} \n#{board_array.join('')}\n"
  end

  #  Helper method to validate one coordinate
  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  #  Helper method to validate multiple coordinates
  def valid_coordinates?(coordinates)
    coordinates.all? { |coordinate| valid_coordinate?(coordinate) }
  end

  # Checks ship length against empty cells
  # If all the cells have the same first letter it will enlist consecuive helper method on numbers
  # If all the cells have consecutive numbers it will enlist consecutive helper method on letters
  def valid_placement?(ship, coordinates)
    return false unless valid_length?(ship, coordinates) && cells_empty?(coordinates)

    letters = coordinates.map { |coordinate| coordinate[0].ord }
    nums = coordinates.map { |coordinate| coordinate[1].to_i }

    if all_the_same?(letters)
      consecutive?(nums)
    elsif all_the_same?(nums)
      consecutive?(letters)
    else
      false
    end
  end

  # Helper method measures ship length and coordinate length
  def valid_length?(ship, coordinates)
    ship.length == coordinates.length
  end

  # Helper method establishes if all incoming coordinates are empty (".")
  def cells_empty?(coordinates)
    coordinates.all? { |coordinate| @cells[coordinate].status == "." }
  end

  # Helper method establishes if all incoming data matches
  def all_the_same?(data)
    data.all? { |piece| piece == data.first }
  end

  # Helper method establishes if all incoming data is successive 
  def consecutive?(data)
    data.each_cons(2).all? { |a, b| b == a + 1 }
  end
end
