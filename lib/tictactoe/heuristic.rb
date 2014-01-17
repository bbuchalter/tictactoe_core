module TicTacToe
  class Heuristic
    def initialize(game, player)
      @game = game
      @player = player
    end

    def evaluate
      player_inversion = player == game.player_one ? 1 : -1
      score_as_player_one * player_inversion
    end

    def score_as_player_one
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

    attr_reader :game, :player

    def winner?
      game.winner == game.player_one
    end

    def threatening_tuples
      game.threats_for(game.player_one)
    end

    def opportunity_tuples
      game.opportunities_for(game.player_one)
    end
  end
end
