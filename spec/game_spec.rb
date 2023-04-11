require "spec_helper"

RSpec.describe Game do
  before(:each) do
    @game = Game.new
  end

  describe "#initialize" do
    it "exists" do
      expect(@game).to be_a(Game)
    end
  end

  describe "#computer_place" do
    it "automatically places first ship on computer board" do
      # expect(@board.cells["A1"]).not_to eq(first_a1)
    end

    it "automatically places second ship on computer board" do
      # expect(@board.cells["A1"]).not_to eq(first_a1)
    end
  end

  describe "#human_place" do
    it "allows human to place first ship on computer board" do
      expect(@board.cells["A1"]).not_to eq(first_a1)
    end

    it "allows human to place second ship on computer board" do
      # expect(@board.cells["A1"]).not_to eq(first_a1)
    end
  end
end
