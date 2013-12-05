require 'player'

module TicTacToe
  class Position
    attr_reader :position, :player
    def initialize(position: position, player: player)
      @position = position
      @player = player
    end
  end
end