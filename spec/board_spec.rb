# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#initialize' do
    it 'Creates an empty board with 7 columns and 6 rows' do
      expect(board.grid.length).to eq(6)
      expect(board.grid.all? { |row| row.length == 7 }).to be true
    end
  end

  describe '#add_piece' do
    it 'adds a piece to the correct column' do
      column = 0
      piece = 'X'
      board.add_piece(column, piece)
      expect(board.grid[5][column]).to eq(piece)
    end
  end
end
