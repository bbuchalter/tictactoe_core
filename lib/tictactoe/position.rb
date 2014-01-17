require 'tictactoe/player'

module TicTacToe
  class Position
    attr_reader :position, :player
    def initialize(position, player)
      @position = position
      @player = player
    end

    def self.empty(position)
      new(position, nil)
    end

    def empty?
      player.nil?
    end

    def corner?
      corner_positions.include?(position)
    end

    alias_method :at, :position

    private

    def corner_positions
      [1, 3, 7, 9]
    end
  end
end
