require "spec_helper"

RSpec.describe Game do
  before(:each) do
    @game = Game.new
  end

  describe "#initialize" do
    it "exists" do
      expect(@game).to be_a(Game)
    end

    it "has four ships" do
      expect(@game.computer_cruiser).to be_a(Ship)
      expect(@game.computer_submarine).to be_a(Ship)
      expect(@game.human_cruiser).to be_a(Ship)
      expect(@game.human_submarine).to be_a(Ship)
    end

    it "has two boards" do
      expect(@game.computer_board).to be_a(Board)
      expect(@game.human_board).to be_a(Board)
    end

    it "instantiates with no winner" do
      expect(@game.winner).to eq(nil)
    end
  end

  describe "#start" do
    # TODO
  end

  describe "#play" do
    # TODO
  end

  describe "#computer_place" do
    it "allows computer to place first ship on computer board" do
      cells = @game.computer_board.cells.values

      expect(cells.all? { |cell| cell.status == "🟦" }).to eq(true)
      @game.computer_place(@game.computer_cruiser)
      expect(cells.count { |cell| cell.status == "⛵️" }).to eq(3)
    end

    it "allows computer to place a second ship on computer board" do
      cells = @game.computer_board.cells.values

      expect(cells.all? { |cell| cell.status == "🟦" }).to eq(true)
      @game.computer_place(@game.computer_cruiser)
      @game.computer_place(@game.computer_submarine)
      expect(cells.count { |cell| cell.status == "⛵️" }).to eq(5)
    end
  end

  describe "#human_place" do
    # You're gonna have to trust us that it works for humans too
  end

  describe "#three_cell_coordinates" do
    it "generates an array of all possible three cell placements" do
      expected = [
        ["A1", "A2", "A3"],
        ["A2", "A3", "A4"],
        ["B1", "B2", "B3"],
        ["B2", "B3", "B4"],
        ["C1", "C2", "C3"],
        ["C2", "C3", "C4"],
        ["D1", "D2", "D3"],
        ["D2", "D3", "D4"],
        ["A1", "B1", "C1"],
        ["B1", "C1", "D1"],
        ["A2", "B2", "C2"],
        ["B2", "C2", "D2"],
        ["A3", "B3", "C3"],
        ["B3", "C3", "D3"],
        ["A4", "B4", "C4"],
        ["B4", "C4", "D4"]
      ]

      expect(@game.three_cell_coordinates).to eq(expected)
    end
  end

  describe "#two_cell_coordinates" do
    it "generates an array of all possible two cell placements" do
      expected = [
        ["A1", "A2"],
        ["A2", "A3"],
        ["A3", "A4"],
        ["B1", "B2"],
        ["B2", "B3"],
        ["B3", "B4"],
        ["C1", "C2"],
        ["C2", "C3"],
        ["C3", "C4"],
        ["D1", "D2"],
        ["D2", "D3"],
        ["D3", "D4"],
        ["A1", "B1"],
        ["B1", "C1"],
        ["C1", "D1"],
        ["A2", "B2"],
        ["B2", "C2"],
        ["C2", "D2"],
        ["A3", "B3"],
        ["B3", "C3"],
        ["C3", "D3"],
        ["A4", "B4"],
        ["B4", "C4"],
        ["C4", "D4"]
      ]

      expect(@game.two_cell_coordinates).to eq(expected)
    end
  end
end
