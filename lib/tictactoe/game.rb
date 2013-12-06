require 'tictactoe/board'

module TicTacToe
  class Game
    attr_reader :board

    def initialize
      @board = ::TicTacToe::Board.new
    end

    def make_move(position, player)
      @board[position] = ::TicTacToe::Position.new(position, player)
    end
  end
end