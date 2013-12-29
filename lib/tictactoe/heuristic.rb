module TicTacToe
  class Heuristic
    def initialize(game)
      @game = game
    end

    def evaluate
      return Float::INFINITY if winner?

      if threatening_tuples.empty?
        if opportunity_tuples.empty?
          0
        else
          1 * opportunity_tuples.count
        end
      else
        10 * threatening_tuples.count
      end
    end

    private

    attr_reader :game

    def winner?
      game.winner == player
    end

    def player
      game.player_one
    end

    def threatening_tuples
      game.threats_for(player)
    end

    def opportunity_tuples
      game.opportunities_for(player)
    end
  end
end
