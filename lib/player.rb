# frozen_string_literal: true

class Player
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  def make_move
    puts "#{name}, please choose where you want to drop your piece (#{piece})"
    puts 'Please enter a number of column from 1 to 7 to identify your option:'
    loop do
      answer = gets.chomp
      return answer if answer.match?(/^[1-7]$/)
    end
  end
end
