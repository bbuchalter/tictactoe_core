require 'board'

module TicTacToe
  class Game
    attr_reader :board

    def initialize
      @board = ::TicTacToe::Board.new
    end
  end
end