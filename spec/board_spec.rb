# frozen_string_literal: true

require_relative '../lib/board'

# rubocop:disable Metrics/BlockLength, Lint/MissingCopEnableDirective
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

    context 'When in column is 3 pieces' do
      it 'adds a piece to the row[3] of column' do
        column = 0
        piece = 'X'
        3.times { board.add_piece(column, piece) }
        expect(board.grid[3][column]).to eq(piece)
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

  describe '#game_over' do
    context 'When 4 same pieces consecutively in a row' do
      it 'returns true' do
        piece = 'X'
        board.add_piece(0, piece)
        board.add_piece(1, piece)
        board.add_piece(2, piece)
        board.add_piece(3, piece)
        expect(board).to be_game_over
      end
    end
    context 'When 4 same pieces consecutively in a column' do
      it 'returns true' do
        piece = 'X'
        4.times { board.add_piece(0, piece) }
        board.add_piece(0, '0')
        expect(board).to be_game_over
      end
    end
    context 'When 4 same pieces consecutively in a diagonal' do
      it 'returns true' do
        piece_x = 'X'
        piece_p = 'P'
        board.add_piece(0, piece_x)
        board.add_piece(1, piece_p)
        board.add_piece(1, piece_x)
        2.times { board.add_piece(2, piece_p) }
        board.add_piece(2, piece_x)
        3.times { board.add_piece(3, piece_p) }
        board.add_piece(3, piece_x)
        expect(board).to be_game_over
      end
    end
  end
end
