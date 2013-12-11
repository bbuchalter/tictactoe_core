module TicTacToe
  module Strategy
    class Fork
      def initialize(game, player)
        @game = game
        @player = player
      end

      def applicable?
        !fork_for(game, player).nil?
      end

      def select_position
        fork_for(game, player)
      end

      private

      attr_reader :game, :player

      include ::TicTacToe::Strategy::Tactics
    end
  end
end
