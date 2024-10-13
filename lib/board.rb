# frozen_string_literal: true

class Board
  attr_reader :grid

  def initialize
    @grid = create_grid
  end

  def add_piece(column, piece)
    row = lowest_available_row(column)
    grid[row][column] = piece
  end

  private

  def create_grid(rows = 6, columns = 7)
    Array.new(rows) { Array.new(columns) }
  end

  def lowest_available_row(column)
    (grid.length - 1).downto(0).find { |row| grid[row][column].nil? }
  end
end
