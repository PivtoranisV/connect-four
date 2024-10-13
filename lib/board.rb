# frozen_string_literal: true

class Board
  attr_reader :grid

  def initialize
    @grid = create_grid
  end

  private

  def create_grid(rows = 6, columns = 7)
    Array.new(rows) { Array.new(columns) }
  end
end
