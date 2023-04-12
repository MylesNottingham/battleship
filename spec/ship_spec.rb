require "spec_helper"

RSpec.describe Ship do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe "#initialize" do
    it "can initialize with attributes" do
      expect(@cruiser).to be_a(Ship)
      expect(@cruiser.name).to eq("Cruiser")
      expect(@cruiser.length).to eq(3)
      expect(@cruiser.health).to eq(3)
      expect(@cruiser.sunk).to eq(false)
    end
  end

  describe "#sunk?" do
    it "let us know if the ship sinks" do
      expect(@cruiser.health).to eq(3)
      expect(@cruiser.sunk?).to eq(false)
      3.times { @cruiser.hit }
      expect(@cruiser.sunk?).to eq(true)
    end
  end

  describe "#hit" do
    it "will reduce the heath of ship when called" do
      expect(@cruiser.health).to eq(3)
      @cruiser.hit
      expect(@cruiser.health).to eq(2)
      @cruiser.hit
      expect(@cruiser.health).to eq(1)
      @cruiser.hit
      expect(@cruiser.health).to eq(0)
    end

    it "will not reduce the heath of ship below zero" do
      expect(@cruiser.health).to eq(3)
      3.times { @cruiser.hit }
      expect(@cruiser.health).to eq(0)
      @cruiser.hit
      expect(@cruiser.health).to eq(0)
    end
  end
end
