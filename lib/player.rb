# frozen_string_literal: true

require 'colorize'

class Player
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  def make_move
    puts "#{name}, please choose where you want to drop your piece (#{piece})".colorize(background: :green)
    puts 'Please enter a number of column from 1 to 7 to identify your option:'.colorize(background: :green)
    loop do
      answer = gets.chomp
      return answer.to_i if valid_input(answer)

      puts 'Invalid option. The input should be a number between 1-7.'.colorize(
        background: :red
      )
    end
  end

  private

  def valid_input(input)
    input.match?(/^[1-7]$/)
  end
end
