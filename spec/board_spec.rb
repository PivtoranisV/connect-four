# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }
  it 'Creates an empty board with 7 columns and 6 rows' do
    expect(board.create_grid.length).to eq(6)
    expect(board.create_grid.all? { |row| row.length == 7 }).to be true
  end
end
