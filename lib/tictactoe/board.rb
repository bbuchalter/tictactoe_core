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
      position = index.to_i - 1
      fail PositionTaken unless board[position].empty?
      board[position] = value
    end

    def tuples
      (row_tuples + column_tuples + diagonal_tuples).flatten
    end

    private

    attr_reader :board

    def row_tuples
      [
          tuple_for(1, 2, 3),
          tuple_for(4, 5, 6),
          tuple_for(7, 8, 9)
      ]
    end

    def column_tuples
      [
          tuple_for(1, 4, 7),
          tuple_for(2, 5, 8),
          tuple_for(3, 6, 9)
      ]
    end

    def diagonal_tuples
      [
          tuple_for(1, 5, 9),
          tuple_for(3, 5, 7)
      ]
    end

    def tuple_for(one, two, three)
      ::TicTacToe::Tuple.new([at(one), at(two), at(three)])
    end

    class PositionTaken < RuntimeError; end
  end
end
