# frozen_string_literal: true

class Board
  attr_reader :grid

  def initialize
    @grid = create_grid
  end

  def add_piece(column, piece)
    row = lowest_available_row(column)
    raise 'Column is full' unless row

    grid[row][column] = piece
  end

  def game_over?
    winning_combination = [
      # rows
      grid[0], grid[1], grid[2], grid[3], grid[4], grid[5]
    ]
    winning_combination.each do |combo|
      combo.each_cons(4) do |four_cell|
        return true if four_cell.uniq.size == 1 && !four_cell.include?(nil)
      end
    end
    false
  end

  private

  def create_grid(rows = 6, columns = 7)
    Array.new(rows) { Array.new(columns) }
  end

  def lowest_available_row(column)
    (grid.length - 1).downto(0).find { |row| grid[row][column].nil? }
  end
end
