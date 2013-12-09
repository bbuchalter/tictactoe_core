module TicTacToe
  module Strategy
    class BlockFork
      def initialize(game, player)
        @game = game
        @player = player
      end

      def applicable?
        !opponents_threat.nil?
      end

      def select_position
        take_side if applicable?
      end

      private

      attr_reader :game, :player

      include ::TicTacToe::Strategy::Tactics

      def opponents_threat
        threatening_position_for(game.other_player(player))
      end
    end
  end
end
