# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/game'

game = Board.new
game.add_piece(0, 'X')
game.add_piece(0, 'X')
game.add_piece(0, 'X')
game.add_piece(0, 'X')
p game.grid
