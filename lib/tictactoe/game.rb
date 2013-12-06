require 'tictactoe/board'

module TicTacToe
  class Game
    def initialize
      @board = ::TicTacToe::Board.new
      @players = []
    end

    def make_move(position, player)
      board.new_move_for(position, ::TicTacToe::Position.new(position, player))
    end

    def setup_player(type, symbol, color)
      players << ::TicTacToe::Player.class_for(type).new(symbol, color)
    end

    def player_one
      players[0]
    end

    def player_two
      players[1]
    end

    def game_over?
      winner? || draw?
    end

    def winner?
      three_positions_in_row_from_same_player?
    end

    def draw?
      no_positions_available?
    end

    def move_at(position)
      board.at(position)
    end

    private

    attr_reader :board

    attr_accessor :players

    def three_positions_in_row_from_same_player?
      board.tuples.any? { |tuple| tuple.all_for_same_player? }
    end

    def no_positions_available?
      board.none?(&:empty?)
    end
  end
end
