# frozen_string_literal: true

require 'colorize'
require_relative 'board'

class Game
  PIECES_OPTIONS = ["\u26AB", "\u26AA"].freeze

  def initialize
    puts "\nHi everyone, welcome to the CONNECT FOUR game\n".colorize(color: :yellow, mode: :bold)
    @board = Board.new
    setup_players
  end

  def play
    loop do
      player_turn(@player1)
      break if @board.check_winner

      player_turn(@player2)
      break if @board.check_winner
    end
  end

  private

  def setup_players
    puts 'Player 1, please enter your name:'.colorize(:green)
    player1_name = gets.chomp
    player1_name = 'Player 1' if player1_name.strip.empty?
    player1_piece = player_piece
    puts "Hi #{player1_name}, your marker will be - #{player1_piece}".colorize(:blue)

    puts 'Player 2, please enter your name:'.colorize(:green)
    player2_name = gets.chomp
    player2_name = 'Player 2' if player2_name.strip.empty?
    player2_piece = player_piece(player1_piece)
    puts "Hi #{player2_name}, your marker will be - #{player2_piece}".colorize(:blue)

    sleep(1)

    @player1 = Player.new(player1_name, player1_piece)
    @player2 = Player.new(player2_name, player2_piece)

    puts "\n#{player1_name} and #{player2_name}, please check below the starting game board".colorize(:green)
    puts "You can place your piece in one of the SEVEN columns\n".colorize(:green)

    display_board
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

  def player_piece(piece = nil)
    return PIECES_OPTIONS.sample unless piece

    PIECES_OPTIONS.reject { |el| el == piece }[0]
  end

  def player_turn(player)
    column_option = player.make_move(@board)
    @board.add_piece(column_option, player.piece)
    display_board
  end
end
