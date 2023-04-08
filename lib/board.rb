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
end

