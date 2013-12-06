require 'tictactoe/position'
require 'tictactoe/tuple'

module TicTacToe
  class Board
    include Enumerable

    def initialize
      @board = Array.new(9) { |i| ::TicTacToe::Position.new((i + 1), nil) }
    end

    def each(&block)
      board.each(&block)
    end

    def length
      board.length
    end

    def at(index)
      board[index - 1]
    end

    def new_move_for(index, value)
      board[index - 1] = value
    end

    def tuples
      (row_tuples + column_tuples + diagonal_tuples).flatten
    end

    private

    attr_reader :board

    def row_tuples
      [
          ::TicTacToe::Tuple.new([at(1), at(2), at(3)]),
          ::TicTacToe::Tuple.new([at(4), at(5), at(6)]),
          ::TicTacToe::Tuple.new([at(7), at(8), at(9)])
      ]
    end

    def column_tuples
      [
          ::TicTacToe::Tuple.new([at(1), at(4), at(7)]),
          ::TicTacToe::Tuple.new([at(2), at(5), at(8)]),
          ::TicTacToe::Tuple.new([at(3), at(6), at(9)])
      ]
    end

    def diagonal_tuples
      [
          ::TicTacToe::Tuple.new([at(1), at(5), at(9)]),
          ::TicTacToe::Tuple.new([at(3), at(5), at(7)])
      ]
    end
  end
end
