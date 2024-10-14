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
      grid[0], grid[1], grid[2], grid[3], grid[4], grid[5],
      # columns
      [grid[0][0], grid[1][0], grid[2][0], grid[3][0], grid[4][0], grid[5][0]],
      [grid[0][1], grid[1][1], grid[2][1], grid[3][1], grid[4][1], grid[5][1]],
      [grid[0][2], grid[1][2], grid[2][2], grid[3][2], grid[4][2], grid[5][2]],
      [grid[0][3], grid[1][3], grid[2][3], grid[3][3], grid[4][3], grid[5][3]],
      [grid[0][4], grid[1][4], grid[2][4], grid[3][4], grid[4][4], grid[5][4]],
      [grid[0][5], grid[1][5], grid[2][5], grid[3][5], grid[4][5], grid[5][5]],
      [grid[0][6], grid[1][6], grid[2][6], grid[3][6], grid[4][6], grid[5][6]]
    ]
    return true if four_in_line(winning_combination)

    false
  end

  private

  def create_grid(rows = 6, columns = 7)
    Array.new(rows) { Array.new(columns) }
  end

  def lowest_available_row(column)
    (grid.length - 1).downto(0).find { |row| grid[row][column].nil? }
  end

  def four_in_line(line)
    line.each do |combo|
      combo.each_cons(4) do |four_cell|
        return true if four_cell.uniq.size == 1 && !four_cell.include?(nil)
      end
    end
    false
  end
end
