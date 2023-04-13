# Establishes Cell class

class Cell
  attr_reader :coordinate,
              :ship,
              :status

  # Instantiates with three attributes and one coordinate parameter
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @status = "."
  end

  # Changes cell status to represent a ship
  def place_ship(ship)
    @ship = ship
    @status = "S"
  end

  # Adjusts cell status based on current status when called
  # Will return false if status can't be accessed
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

  # Will reveal Cell status if passed true
  # Cell status dependent on current status at the time
  def render(reveal = false)
    if @status == "S"
      reveal ? "S" : "."
    elsif @status == "H" && @ship.sunk?
      "X"
    else
      @status
    end
  end

  # Returns true if status is "empty"
  def empty?
    @status == "."
  end

  # Returns true if status is already a miss or hit
  def fired_upon?
    @status == "M" || @status == "H"
  end
end
