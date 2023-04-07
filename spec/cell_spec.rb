require "spec_helper"

RSpec.describe Cell do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
    @cell = Cell.new("B4")
  end

  describe "#initialize" do
    it "can initialize with attributes" do
      expect(@cell).to be_a(Cell)
      expect(@cell.coordinate).to eq("B4")
      expect(@cell.ship).to eq(nil)
      expect(@cell.status).to eq(".")
    end
  end

  describe "#empty?" do
    it "will return true if status is empty" do
      expect(@cell.status).to eq(".")
      expect(@cell.empty?).to eq(true)
    end

    it "will return false if status is not empty" do
      @cell.place_ship(@cruiser)
      expect(@cell.status).to eq("S")
      expect(@cell.empty?).to eq(false)
    end
  end

  describe "#place_ship" do
    it "can place a ship in the cell" do
      expect(@cell.status).to eq(".")
      expect(@cell.empty?).to eq(true)
      expect(@cell.ship).to eq(nil)
      @cell.place_ship(@cruiser)
      expect(@cell.status).to eq("S")
      expect(@cell.empty?).to eq(false)
      expect(@cell.ship).to eq(@cruiser)
    end
  end

  describe "#fired_upon?" do
    it "will return true if fired upon and empty" do
      expect(@cell.status).to eq(".")
      expect(@cell.fired_upon?).to eq(false)
      @cell.fire_upon
      expect(@cell.fired_upon?).to eq(true)
    end

    it "will return true if fired upon and occupied" do
      @cell.place_ship(@cruiser)
      expect(@cell.status).to eq("S")
      expect(@cell.fired_upon?).to eq(false)
      @cell.fire_upon
      expect(@cell.fired_upon?).to eq(true)
    end
  end

  describe "#fire_upon" do
    it "will change cell status to miss if empty" do
      expect(@cell.status).to eq(".")
      @cell.fire_upon
      expect(@cell.status).to eq("M")
    end

    it "will change cell status to hit if occupied" do
      @cell.place_ship(@cruiser)
      expect(@cell.status).to eq("S")
      @cell.fire_upon
      expect(@cell.status).to eq("H")
    end

    it "will take one health from ship" do
      @cell.place_ship(@cruiser)
      expect(@cell.ship.health).to eq(3)
      @cell.fire_upon
      expect(@cell.ship.health).to eq(2)
    end
  end
end
