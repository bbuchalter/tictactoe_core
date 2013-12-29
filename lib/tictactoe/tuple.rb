module TicTacToe
  class Tuple
    include Enumerable

    def initialize(tuple)
      @tuple = tuple
    end

    def [](index)
      tuple[index]
    end

    def each(&block)
      @tuple.each(&block)
    end

    def all_for_same_player?
      player = find_any_player_in_tuple
      return false if player.nil?
      tuple.all? { |position| position.player == player }
    end

    def two_for_same_player?
      player = find_any_player_in_tuple
      return false if player.nil?
      two_for?(player)
    end

    def one_empty?
      tuple.count { |position| position.empty? } == 1
    end

    def two_empty?
      tuple.count { |position| position.empty? } == 2
    end

    def two_for?(player)
      tuple.count { |position| position.player == player } == 2
    end

    def one_for?(player)
      tuple.count { |position| position.player == player } == 1
    end

    private

    def find_any_player_in_tuple
      position = position_with_player
      position.nil? ? nil : position.player
    end

    def position_with_player
      tuple.find { |position| !position.empty? }
    end

    attr_reader :tuple
  end
end
