class Cell
  attr_reader :coordinate,
              :ship,
              :status

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @status = "."
  end

  def place_ship(ship)
    @ship = ship
    @status = "S"
  end

  def fire_upon
    if @status == "."
      @status = "M"
    elsif @status == "S"
      @status = "H"
      @ship.hit
    else
      false
    end
  end

  def render(reveal = false)
    if @status == "S"
      reveal ? "S" : "."
    elsif @status == "H" && @ship.sunk?
      "X"
    else
      @status
    end
  end

  def empty?
    @status == "."
  end

  def fired_upon?
    @status == "M" || @status == "H"
  end
end
