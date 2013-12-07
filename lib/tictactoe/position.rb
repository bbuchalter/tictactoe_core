require 'tictactoe/player'

module TicTacToe
  class Position
    attr_reader :position, :player
    def initialize(position, player)
      @position = position
      @player = player
    end
  end
end
