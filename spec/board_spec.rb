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
    it "creates a new board each time it is called" do
      expect(@board.cells).to be_a(Hash)
      first_a1 = @board.cells["A1"]
      @board.create_cells
      expect(@board.cells).to be_a(Hash)
      expect(@board.cells["A1"]).not_to eq(first_a1)
    end
  end

  describe "#place" do
    it "will not place ship if coordinantes are invalid" do
      expect(@board.cells["A5"]).to eq(nil)
      expect(@board.cells["A6"]).to eq(nil)
      expect(@board.cells["A7"]).to eq(nil)
      @board.place(@cruiser, ["A5", "A6", "A7"])
      expect(@board.cells["A5"]).to eq(nil)
      expect(@board.cells["A6"]).to eq(nil)
      expect(@board.cells["A7"]).to eq(nil)
    end

    it "will not place ship if placement is invalid" do
      @board.place(@cruiser, ["A1", "B2", "C3"])
      expect(@board.cells["A1"].ship).to eq(nil)
      expect(@board.cells["B2"].ship).to eq(nil)
      expect(@board.cells["C3"].ship).to eq(nil)
    end

    it "will place ship if coordinates and placement are valid" do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board.cells["A1"].ship).to eq(@cruiser)
      expect(@board.cells["A2"].ship).to eq(@cruiser)
      expect(@board.cells["A3"].ship).to eq(@cruiser)
    end

    it "placing ship will change cell state to 'S'" do
      expect(@board.cells["A1"].status).to eq(".")
      expect(@board.cells["A2"].status).to eq(".")
      expect(@board.cells["A3"].status).to eq(".")
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board.cells["A1"].status).to eq("S")
      expect(@board.cells["A2"].status).to eq("S")
      expect(@board.cells["A3"].status).to eq("S")
    end
  end

  describe "#render" do
    it "will render an empty board" do
      expect(@board.render).to eq(
        "  1 2 3 4 \n"\
        "A . . . . \n"\
        "B . . . . \n"\
        "C . . . . \n"\
        "D . . . . \n\n"
      )
      expect(@board.render(true)).to eq(
        "  1 2 3 4 \n"\
        "A . . . . \n"\
        "B . . . . \n"\
        "C . . . . \n"\
        "D . . . . \n\n"
      )
    end

    it "will render a board with ships but hide them" do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board.render).to eq(
        "  1 2 3 4 \n"\
        "A . . . . \n"\
        "B . . . . \n"\
        "C . . . . \n"\
        "D . . . . \n\n"
      )
    end

    it "will render a board with ships and show them with 'true' argument" do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board.render(true)).to eq(
        "  1 2 3 4 \n"\
        "A S S S . \n"\
        "B . . . . \n"\
        "C . . . . \n"\
        "D . . . . \n\n"
      )
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

  describe "#valid_coordinates?" do
    # TODO
  end

  describe "#valid_placement?" do
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

    it "will return false if cell is occupied by a ship" do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
    end

    it "will return true if placement is valid" do
      expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
      expect(@board.valid_placement?(@submarine, ["B3", "B4"])).to eq(true)
    end
  end

  describe "#valid_length?" do
    it "will return true if board includes coordinate" do
      expect(@board.valid_coordinate?("A1")).to eq(true)
      expect(@board.valid_coordinate?("D4")).to eq(true)
    end
  end

  describe "#cells_empty?" do
    # TODO
  end

  describe "#all_the_same?" do
    # TODO
  end

  describe "#consecutive?" do
    # TODO
  end
end
