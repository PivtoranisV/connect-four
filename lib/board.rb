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
    #  Row
    grid.each do |row|
      return true if four_in_line?(row)
    end
    # Column
    grid.transpose.each do |column|
      return true if four_in_line?(column)
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

  def four_in_line?(line)
    line.each_cons(4) do |four_cell|
      return true if four_cell.uniq.size == 1 && !four_cell.include?(nil)
    end
    false
  end
end
