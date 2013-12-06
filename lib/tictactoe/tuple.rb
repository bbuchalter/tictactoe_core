module TicTacToe
  class Tuple
    def initialize(tuple)
      @tuple = tuple
    end

    def [](index)
      tuple[index]
    end

    def all_for_same_player?
      player = tuple[0].player
      tuple.all? { |position| position.player == player && !position.empty? }
    end

    private

    attr_reader :tuple
  end
end
