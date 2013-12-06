require 'position'

module TicTacToe
  class Board
    include Enumerable

    def initialize
      @board = Array.new(9) { |i| ::TicTacToe::Position.new(position: (i+1), player: nil)}
    end

    def each(&block)
      @board.each(&block)
    end

    def length
      @board.length
    end
  end
end