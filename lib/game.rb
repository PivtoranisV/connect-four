# frozen_string_literal: true

require 'colorize'
require_relative 'board'

class Game
  PIECES_OPTIONS = ["\u26AA", "\u26AB"].freeze

  def initialize
    puts "\nHi everyone, welcome to the CONNECT FOUR game\n".colorize(color: :yellow, mode: :bold)
    @board = Board.new
  end

  def display_board
    puts '|  1  |  2  |  3  |  4  |  5  |  6  |  7  |'.colorize(color: :yellow, mode: :bold)
    puts '|-----|-----|-----|-----|-----|-----|-----|'.colorize(background: :blue)

    @board.grid.each do |row|
      formatted_row = row.map { |cell| cell.nil? ? '   ' : " #{cell}" }.join(' | ')

      puts "| #{formatted_row} |".colorize(background: :blue)
      puts '|_____|_____|_____|_____|_____|_____|_____|'.colorize(background: :blue)
    end
  end
end
