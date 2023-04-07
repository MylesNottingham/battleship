require "spec_helper"

RSpec.describe Board do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
    @board = Board.new
  end

  describe "board" do
    it "exists" do
      expect(@board).to be_a(Board)
    end
  end

  describe "#cells" do
    it "can initialize a cell with attributes" do
      expect(@board.cells).to be_a(Hash)
      expect(@board.cells.count).to eq(16)
    end
  end
end
