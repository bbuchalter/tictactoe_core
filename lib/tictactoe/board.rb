require 'tictactoe/position'

module TicTacToe
  class Board
    include Enumerable

    def initialize
      @board = Array.new(9) { |i| ::TicTacToe::Position.new((i + 1), nil) }
    end

    def each(&block)
      @board.each(&block)
    end

    def length
      @board.length
    end

    def [](index)
      @board[index - 1]
    end

    def []=(index, value)
      @board[index - 1] = value
    end
  end
end
