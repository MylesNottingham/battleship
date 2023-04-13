require "spec_helper"

RSpec.describe Turn do
  before(:each) do
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @human_cruiser = Ship.new("Cruiser", 3)
    @human_submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @human_board = Board.new
    @turn = Turn.new(
      @computer_cruiser,
      @computer_submarine,
      @human_cruiser,
      @human_submarine,
      @computer_board,
      @human_board
    )
  end

  describe "#initialize" do
    it "exists" do
      expect(@turn).to be_a(Turn)
    end

    it "initalizes with no winner" do
      expect(@turn.turn_winner).to eq(nil)
    end
  end

  describe "#start" do
    # TODO
  end

  describe "#display_boards" do
    # TODO
  end

  describe "#human_shot" do
    # TODO
  end

  describe "#computer_shot" do
    # TODO
  end

  describe "#display_results" do
    # TODO
  end

  describe "#determine_winner" do
    # TODO
  end
end
