require 'tictactoe/board'

module TicTacToe
  class Game
    attr_reader :board

    def initialize
      @board = ::TicTacToe::Board.new
      @players = []
    end

    def make_move(position, player)
      @board[position] = ::TicTacToe::Position.new(position, player)
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

    private

    attr_accessor :players
  end
end
