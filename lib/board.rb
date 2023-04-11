class Board
  attr_reader :cells

  def initialize
    create_cells
  end

  def create_cells
    @cells = {}
    ("A".."D").each do |letter|
      4.times do |index|
        cell = "#{letter}#{index + 1}"
        @cells[cell] = Cell.new(cell)
      end
    end
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    return false unless ship.length == coordinates.length
    return false unless coordinates.all? { |coordinate| @cells[coordinate].status == "." }

    letters = coordinates.map { |coordinate| coordinate[0].ord }
    nums = coordinates.map { |coordinate| coordinate[1].to_i }

    if letters.all? { |letter| letter == letters.first }
      nums.each_cons(2).all? { |a, b| b == a + 1 }
    elsif nums.all? { |num| num == nums.first }
      letters.each_cons(2).all? { |a, b| b == a + 1 }
    else
      false
    end
  end

  def place(ship, coordinates)
    return false unless coordinates.all? { |coordinate| valid_coordinate?(coordinate) }
    return false unless valid_placement?(ship, coordinates)

    coordinates.each { |coordinate| @cells[coordinate].place_ship(ship) }
  end

  def render(reveal = false)
    rows = []
    @cells.values.each_slice(4) { |cells| rows << cells }

    columns = (1..(rows.count)).to_a.join(" ")

    board_array = []
    rows.each_with_index do |row, index|
      board_array << "#{(65 + index).chr} #{row.map { |cell| cell.render(reveal) }.join(' ')} \n"
    end

    "  #{columns} \n#{board_array.join('')}"
  end
end
