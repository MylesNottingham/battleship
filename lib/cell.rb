# Establishes Cell class
class Cell
  attr_reader :coordinate,
              :ship,
              :status

  # Instantiates with three attributes and one coordinate argument
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @status = "🟦"
  end

  # Changes cell status to represent a ship
  def place_ship(ship)
    @ship = ship
    @status = "⛵️"
  end

  # Adjusts cell status to reflect being fired upon based on current status when called
  # Will return false if cell has already been fired upon
  def fire_upon
    if @status == "🟦"
      @status = "⬜️"
    elsif @status == "⛵️"
      @status = "💥"
      @ship.hit
    else
      false
    end
  end

  # Returns cell status as string
  # Will reveal ship location if argument is true
  def render(reveal = false)
    if @status == "⛵️"
      reveal ? "⛵️" : "🟦"
    elsif @status == "💥" && @ship.sunk?
      "💀"
    else
      @status
    end
  end

  # Returns true if status is "empty"
  def empty?
    @status == "🟦"
  end

  # Returns true if status is already a miss or hit
  def fired_upon?
    @status == "⬜️" || @status == "💥"
  end
end
