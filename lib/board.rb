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

  def valid_length?(ship, coordinates)
    ship.length == coordinates.length
  end

  def cells_empty?(coordinates)
    coordinates.all? { |coordinate| @cells[coordinate].status == "." }
  end

  def all_the_same?(data)
    data.all? { |piece| piece == data.first }
  end

  def consecutive?(data)
    data.each_cons(2).all? { |a, b| b == a + 1 }
  end

end
