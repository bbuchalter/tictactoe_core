module TicTacToe
  module Strategy
    class Fork
      include ::TicTacToe::Strategy::Tactics

      def initialize(game, player)
        @game = game
        @player = player
      end

      def applicable?
        !threatening_position_for(player).nil?
      end

      def select_position
        threatening_position_for(player)
      end

      private

      attr_reader :game, :player
    end
  end
end