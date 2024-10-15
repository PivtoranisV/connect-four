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
      break if game_over?

      player_turn(@player2)
      break if game_over?
    end
    display_result
  end

  private

  def setup_players
    @player1 = create_player('Player 1', nil)
    @player2 = create_player('Player 2', @player1.piece)

    puts "\n#{@player1.name} and #{@player2.name}, please check below the starting game board\n".colorize(:green)
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

  def game_over?
    @board.check_winner || @board.game_tie?
  end

  def display_result
    winner_piece = @board.check_winner
    if winner_piece
      winner_name = winner_piece == @player1.piece ? @player1.name : @player2.name
      puts "\n#{winner_name} wins! Congratulations!".colorize(:blue)
    else
      puts "\nIt's a tie!".colorize(:yellow)
    end
  end

  def create_player(default_name, other_piece)
    puts "#{default_name}, please enter your name:".colorize(:green)
    name = gets.chomp
    name = default_name if name.strip.empty?
    piece = other_piece ? player_piece(other_piece) : player_piece
    puts "Hi #{name}, your piece will be - #{piece}".colorize(:blue)
    sleep(1)
    Player.new(name, piece)
  end
end
