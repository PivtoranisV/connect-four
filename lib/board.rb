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

  def check_winner
    #  Row
    grid.each do |row|
      return four_in_line?(row) if four_in_line?(row)
    end
    # Column
    grid.transpose.each do |column|
      return four_in_line?(column) if four_in_line?(column)
    end
    # Diagonal
    diagonal_winner = diagonal_check(grid)
    return diagonal_winner if diagonal_winner

    reverse_diagonal_winner = diagonal_check(grid.reverse)
    return reverse_diagonal_winner if reverse_diagonal_winner

    false
  end

  def game_tie?
    grid.flatten.none?(&:nil?) && !game_over?
  end

  def lowest_available_row(column)
    (grid.length - 1).downto(0).find { |row| grid[row][column].nil? }
  end

  private

  def create_grid(rows = 6, columns = 7)
    Array.new(rows) { Array.new(columns) }
  end

  def four_in_line?(line)
    line.each_cons(4) do |four_cell|
      return four_cell[0] if four_cell.uniq.size == 1 && !four_cell.include?(nil)
    end
    false
  end

  def diagonal_check(grid)
    # Loop over possible diagonal starting points
    (0..grid.length - 4).each do |row|
      (0..grid[0].length - 4).each do |col|
        diagonal = (0..3).map { |i| grid[row + i][col + i] }
        return four_in_line?(diagonal) if four_in_line?(diagonal)
      end
    end
    false
  end
end
