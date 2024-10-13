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
    context 'When column is empty' do
      it 'adds a piece to the bottom of column' do
        column = 0
        piece = 'X'
        board.add_piece(column, piece)
        expect(board.grid[5][column]).to eq(piece)
      end
    end

    context 'When column is full' do
      it 'does not allow a piece to be added' do
        column = 0
        piece = 'X'
        6.times { board.add_piece(column, piece) }
        expect { board.add_piece(column, piece) }.to raise_error('Column is full')
      end
    end
  end
end
