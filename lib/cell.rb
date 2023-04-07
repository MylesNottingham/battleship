class Cell
  attr_reader :coordinate,
              :ship,
              :status

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @status = "empty"
  end

  def empty?
    @status == "empty"
  end

  def place_ship(ship)
    @ship = ship
    @status = "occupied"
  end
end
