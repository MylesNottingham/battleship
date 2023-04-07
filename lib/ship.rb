class Ship
  attr_reader :name,
              :length,
              :health,
              :sunk

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @sunk = false
  end

  def sunk?
    @sunk
  end

  def hit
    @health -= 1 unless @health <= 0
    @sunk = true if @health.zero?
  end
end
