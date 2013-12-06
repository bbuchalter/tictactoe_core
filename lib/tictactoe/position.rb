require 'tictactoe/player'

module TicTacToe
  class Position
    attr_reader :position, :player
    def initialize(position, player)
      @position = position
      @player = player
    end

    def empty?
      player.nil?
    end
  end
end
