# Establishes Ship class
class Ship
  attr_reader :name,
              :length,
              :health,
              :sunk

  # Instantiates with a ship name and length of cells it will occupy as arguements
  # Health is set based on length and ship is not sunk by default
  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @sunk = false
  end

  # Returns sunk state
  def sunk?
    @sunk
  end

  # Takes one health from ship each time it is called until zero
  # Sets "@sunk" to true if health is zero
  def hit
    @health -= 1 unless @health <= 0
    @sunk = true if @health.zero?
  end
end
