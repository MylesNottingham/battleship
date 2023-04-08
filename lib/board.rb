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
end
