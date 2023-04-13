# Establishes Ship class
class Ship
  attr_reader :name,
              :length,
              :health,
              :sunk

  # Instantiates with four variables
  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @sunk = false
  end

  # Returns sunk status
  def sunk?
    @sunk
  end

  # Takes health from ship and establishes sunk status
  def hit
    @health -= 1 unless @health <= 0
    @sunk = true if @health.zero?
  end
end
