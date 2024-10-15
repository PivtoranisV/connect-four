# frozen_string_literal: true

require 'colorize'

class Player
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  def make_move(board)
    puts "#{name}, please choose where you want to drop your piece (#{piece})".colorize(background: :green)
    puts 'Please enter a number of column from 1 to 7 to identify your option:'.colorize(background: :green)
    loop do
      answer = gets.chomp.to_i
      return answer if valid_input(answer, board)

      puts 'Invalid option. The input should be a number between 1-7.'.colorize(
        background: :red
      )
    end
  end

  private

  def valid_input(input, board)
    input.to_s.match?(/^[1-7]$/) && board.lowest_available_row(input)
  end
end
