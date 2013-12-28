module TicTacToe
  module Player
    attr_reader :symbol, :color

    def initialize(symbol, color)
      @symbol = symbol
      @color = color
    end

    def ==(other)
      symbol == other.symbol && color == other.color
    end

    def to_hash
      {
          symbol: symbol,
          color: color
      }
    end
  end
end
