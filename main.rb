# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/game'

game = Board.new
game.add_piece(0, 'X')
game.add_piece(1, 'X')
game.add_piece(2, 'X')
game.add_piece(3, 'X')
game.add_piece(4, 'P')
p game.game_over?
p game.grid
