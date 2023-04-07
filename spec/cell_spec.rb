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
      expect(@cell.status).to eq("empty")
    end
  end

  describe "#empty?" do
    it "will return true if status is empty" do
      expect(@cell.status).to eq("empty")
      expect(@cell.empty?).to eq(true)
    end

    it "will return false if status is not empty" do
      @cell.place_ship(@cruiser)
      expect(@cell.status).to eq("occupied")
      expect(@cell.empty?).to eq(false)
    end
  end

  describe "#place_ship" do
    it "can place a ship in the cell" do
      expect(@cell.status).to eq("empty")
      expect(@cell.empty?).to eq(true)
      expect(@cell.ship).to eq(nil)
      @cell.place_ship(@cruiser)
      expect(@cell.status).to eq("occupied")
      expect(@cell.empty?).to eq(false)
      expect(@cell.ship).to eq(@cruiser)
    end
  end
end
