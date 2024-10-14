# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/player'

game = Board.new
game.add_piece(0, 'X')
game.add_piece(1, '0')
game.add_piece(1, 'X')
game.add_piece(2, '0')
game.add_piece(2, '0')
game.add_piece(2, 'X')
game.add_piece(3, '0')
game.add_piece(3, '0')
game.add_piece(3, '0')
game.add_piece(3, 'X')
p game.game_over?
game.grid.each { |row| p row }

player = Player.new('Bob', 'X')
player.make_move
