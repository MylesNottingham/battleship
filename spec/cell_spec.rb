require "spec_helper"

RSpec.describe Cell do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
  end

  describe "#initialize" do
    it "can initialize a cell with attributes" do
      expect(@cell_1).to be_a(Cell)
      expect(@cell_1.coordinate).to eq("B4")
      expect(@cell_1.ship).to eq(nil)
      expect(@cell_1.status).to eq("🟦")
    end

    it "can initialize another cell with attributes" do
      expect(@cell_2).to be_a(Cell)
      expect(@cell_2.coordinate).to eq("C3")
      expect(@cell_2.ship).to eq(nil)
      expect(@cell_2.status).to eq("🟦")
    end
  end

  describe "#place_ship" do
    it "can place a ship in the cell" do
      expect(@cell_1.status).to eq("🟦")
      expect(@cell_1.empty?).to eq(true)
      expect(@cell_1.ship).to eq(nil)
      @cell_1.place_ship(@cruiser)
      expect(@cell_1.status).to eq("⛵️")
      expect(@cell_1.empty?).to eq(false)
      expect(@cell_1.ship).to eq(@cruiser)
    end
  end

  describe "#fire_upon" do
    it "will change cell status to miss if empty" do
      expect(@cell_1.status).to eq("🟦")
      @cell_1.fire_upon
      expect(@cell_1.status).to eq("⬜️")
    end

    it "will change cell status to hit if occupied" do
      @cell_1.place_ship(@cruiser)
      expect(@cell_1.status).to eq("⛵️")
      @cell_1.fire_upon
      expect(@cell_1.status).to eq("💥")
    end

    it "will take one health from ship" do
      @cell_1.place_ship(@cruiser)
      expect(@cell_1.ship.health).to eq(3)
      @cell_1.fire_upon
      expect(@cell_1.ship.health).to eq(2)
    end
  end

  describe "#render" do
    it "will render '.' cell status as '.' with no argument" do
      expect(@cell_1.status).to eq("🟦")
      expect(@cell_1.render).to eq("🟦")
    end

    it "will render '.' cell status as '.' with 'true' argument" do
      expect(@cell_1.status).to eq("🟦")
      expect(@cell_1.render(true)).to eq("🟦")
    end

    it "will render 'S' cell status as '.' with no argument" do
      expect(@cell_1.status).to eq("🟦")
      @cell_1.place_ship(@cruiser)
      expect(@cell_1.status).to eq("⛵️")
      expect(@cell_1.render).to eq("🟦")
    end

    it "will render 'S' cell status as 'S' with 'true' argument" do
      expect(@cell_1.status).to eq("🟦")
      @cell_1.place_ship(@cruiser)
      expect(@cell_1.status).to eq("⛵️")
      expect(@cell_1.render(true)).to eq("⛵️")
    end

    it "will render 'M' cell status as 'M' with no argument" do
      expect(@cell_1.status).to eq("🟦")
      @cell_1.fire_upon
      expect(@cell_1.status).to eq("⬜️")
      expect(@cell_1.render).to eq("⬜️")
    end

    it "will render 'M' cell status as 'M' with 'true' argument" do
      expect(@cell_1.status).to eq("🟦")
      @cell_1.fire_upon
      expect(@cell_1.status).to eq("⬜️")
      expect(@cell_1.render(true)).to eq("⬜️")
    end

    it "will render 'H' cell status as 'H' with no argument" do
      expect(@cell_1.status).to eq("🟦")
      @cell_1.place_ship(@cruiser)
      @cell_1.fire_upon
      expect(@cell_1.status).to eq("💥")
      expect(@cell_1.render).to eq("💥")
    end

    it "will render 'H' cell status as 'H' with 'true' argument" do
      expect(@cell_1.status).to eq("🟦")
      @cell_1.place_ship(@cruiser)
      @cell_1.fire_upon
      expect(@cell_1.status).to eq("💥")
      expect(@cell_1.render(true)).to eq("💥")
    end

    it "will render 'H' cell status as 'X' if sunk with no argument" do
      expect(@cell_1.status).to eq("🟦")
      @cell_1.place_ship(@cruiser)
      expect(@cell_1.ship.health).to eq(3)
      @cell_1.fire_upon
      expect(@cell_1.ship.health).to eq(2)
      expect(@cell_1.render).to eq("💥")
      @cruiser.sunk?
      @cruiser.hit
      expect(@cell_1.ship.health).to eq(1)
      expect(@cell_1.render).to eq("💥")
      @cruiser.hit
      expect(@cell_1.ship.health).to eq(0)
      expect(@cell_1.render).to eq("💀")
    end

    it "will render 'H' cell status as 'X' if sunk with 'true' argument" do
      expect(@cell_1.status).to eq("🟦")
      @cell_1.place_ship(@cruiser)
      expect(@cell_1.ship.health).to eq(3)
      @cell_1.fire_upon
      expect(@cell_1.ship.health).to eq(2)
      expect(@cell_1.render).to eq("💥")
      @cruiser.sunk?
      @cruiser.hit
      expect(@cell_1.ship.health).to eq(1)
      expect(@cell_1.render).to eq("💥")
      @cruiser.hit
      expect(@cell_1.ship.health).to eq(0)
      expect(@cell_1.render(true)).to eq("💀")
    end
  end

  describe "#empty?" do
    it "will return true if status is empty" do
      expect(@cell_1.status).to eq("🟦")
      expect(@cell_1.empty?).to eq(true)
    end

    it "will return false if status is not empty" do
      @cell_1.place_ship(@cruiser)
      expect(@cell_1.status).to eq("⛵️")
      expect(@cell_1.empty?).to eq(false)
    end
  end

  describe "#fired_upon?" do
    it "will return true if fired upon and empty" do
      expect(@cell_1.status).to eq("🟦")
      expect(@cell_1.fired_upon?).to eq(false)
      @cell_1.fire_upon
      expect(@cell_1.fired_upon?).to eq(true)
    end

    it "will return true if fired upon and occupied" do
      @cell_1.place_ship(@cruiser)
      expect(@cell_1.status).to eq("⛵️")
      expect(@cell_1.fired_upon?).to eq(false)
      @cell_1.fire_upon
      expect(@cell_1.fired_upon?).to eq(true)
    end
  end
end
