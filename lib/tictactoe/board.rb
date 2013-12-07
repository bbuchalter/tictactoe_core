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

    def at(position)
      board[index_for(position)]
    end

    def index_for(position)
      position.to_i - 1
    end

    def new_move_for(position, value)
      fail InvalidPosition unless position.to_i.between?(1, 9)
      fail PositionTaken unless board[index_for(position)].empty?
      board[index_for(position)] = value
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

    class PositionTaken < RuntimeError
    end
    class InvalidPosition < RuntimeError
    end
  end
end
