require "spec_helper"

RSpec.describe Board do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
    @board = Board.new
  end

  describe "#initialize" do
    it "exists" do
      expect(@board).to be_a(Board)
    end

    it "instantiates with a board of 16 cells" do
      expect(@board.cells).to be_a(Hash)
      expect(@board.cells.count).to eq(16)
    end
  end

  describe "#create_cells" do
    it "creates a new board of 16 cells when called" do
      expect(@board.cells).to be_a(Hash)
      first_a1 = @board.cells["A1"]
      @board.create_cells
      expect(@board.cells).to be_a(Hash)
      expect(@board.cells["A1"]).not_to eq(first_a1)
    end
  end

  describe "#valid_coordinate?" do
    it "will return true if board includes coordinate" do
      expect(@board.valid_coordinate?("A1")).to eq(true)
      expect(@board.valid_coordinate?("D4")).to eq(true)
    end

    it "will return false if board does not include coordinate" do
      expect(@board.valid_coordinate?("A5")).to eq(false)
      expect(@board.valid_coordinate?("E1")).to eq(false)
      expect(@board.valid_coordinate?("A22")).to eq(false)
    end
  end
end
