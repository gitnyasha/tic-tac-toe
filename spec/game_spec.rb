require_relative "../lib/game_logic"
require_relative "../lib/players"

RSpec.describe Board do
  let(:board) { Board.new }

  describe "#initialize" do
    it "returns a 3 by 3 grid in the correct order" do
      expect(board.board).to match_array([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe "#move" do
    it "returns the right move" do
      expect(board.move(true, 1)).to eql("X")
      expect(board.move(false, 1)).to eql("O")
    end
  end

  describe "#win?" do
    it 'Check if "X" has won' do
      board.board = ["X", "X", "X", "O", "O", 6, 7, "O", 9]
      expect(board.win?).to eql("X")
    end

    it 'Check if "Y" has won on the cross line' do
      board.board = ["X", 2, "O", 4, "O", "X", "O", "X", 9]
      expect(board.win?).to eql("O")
    end
  end

  describe "#draw?" do
    it "returns true if draw" do
      expect(board.draw?).to be(true)
    end

    it "returns false if draw has no integer" do
      board.board = %w[O X O X X O X O X]
      expect(board.draw?).to eql(false)
    end

    it "returns true if draw has an integer" do
      board.board = ["O", 2, "O", "X", "X", "O", "X", "O", "X"]
      expect(board.draw?).to eql(true)
    end
  end
end

RSpec.describe Player do
  describe "#initialize" do
    it "Player name is a string" do
      player = Player.new("marshall")
      expect((player.name.is_a? String)).to eql(true)
    end
  end
end
