# frozen_string_literal: true

require 'colorize'

# The Player class represents a participant in the Connect Four game.
# It encapsulates the player's name and the game piece they use to make moves.
#
# The Player class interacts with the Board class to manage player moves and validate
# game state. It ensures that players can only make valid moves in the game.
class Player
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  def make_move(board)
    puts "\n#{name}, please choose where you want to drop your piece (#{piece})".colorize(color: :green)
    puts 'Please enter a number of column from 1 to 7 to identify your option:'.colorize(color: :green)
    loop do
      answer = gets.chomp.to_i - 1
      return answer if valid_input(answer, board)

      puts 'Invalid option. Either the input is not a number between 1-7 or the column is full.'.colorize(
        background: :red
      )
    end
  end

  private

  def valid_input(input, board)
    input.between?(0, 6) && board.lowest_available_row(input)
  end
end
