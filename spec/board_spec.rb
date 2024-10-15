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

  describe '#check_winner' do
    context 'When 4 same pieces consecutively in a row' do
      it 'returns the winning piece' do
        piece_x = 'X'
        4.times { |i| board.add_piece(i, piece_x) }
        expect(board.check_winner).to eq(piece_x)
      end
    end

    context 'When 4 same pieces consecutively in a column' do
      it 'returns the winning piece' do
        piece_x = 'X'
        4.times { board.add_piece(0, piece_x) }
        expect(board.check_winner).to eq(piece_x)
      end
    end

    context 'When 4 same pieces consecutively in a diagonal' do
      it 'returns the winning piece' do
        piece_x = 'X'
        piece_p = 'P'

        board.add_piece(0, piece_x)
        board.add_piece(1, piece_p)
        board.add_piece(1, piece_x)
        2.times { board.add_piece(2, piece_p) }
        board.add_piece(2, piece_x)
        3.times { board.add_piece(3, piece_p) }
        board.add_piece(3, piece_x)

        expect(board.check_winner).to eq(piece_x)
      end
    end
  end

  describe '#game_tie?' do
    context 'When the board is full and no winning combination' do
      it 'returns true' do
        piece_x = 'X'
        piece_p = 'P'
        board.grid[0] = [piece_x, piece_x, piece_p, piece_p, piece_x, piece_x, piece_x]
        board.grid[1] = [piece_p, piece_x, piece_x, piece_x, piece_p, piece_x, piece_x]
        board.grid[2] = [piece_x, piece_p, piece_p, piece_x, piece_p, piece_x, piece_x]
        board.grid[3] = [piece_x, piece_p, piece_x, piece_x, piece_p, piece_p, piece_p]
        board.grid[4] = [piece_x, piece_x, piece_p, piece_p, piece_x, piece_p, piece_x]
        board.grid[5] = [piece_p, piece_x, piece_x, piece_p, piece_p, piece_x, piece_p]

        expect(board).to be_game_tie
      end
    end
  end
end
