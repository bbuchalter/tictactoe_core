module TicTacToe
  class Player
    attr_reader :symbol, :color

    def initialize(symbol: symbol, color: color)
      @symbol = symbol
      @color = color
    end
  end
end