require "spec_helper"

RSpec.describe Board do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
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

  describe "#valid_placement?" do
    it "will return true if ship length is equal to coordinate array length" do
      expect(@board.valid_placement?(@cruiser, ["A2", "A3", "A4"])).to eq(true)
      expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
    end

    it "will return false if ship length is not equal to coordinate array length" do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
    end

    it "will return false if coordinate array is not consecutive" do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
    end

    it "will return false if coordinate array is diagonal" do
      expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
    end

    it "will return true if placement is valid" do
      expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
      expect(@board.valid_placement?(@submarine, ["B3", "B4"])).to eq(true)
    end
  end
end
