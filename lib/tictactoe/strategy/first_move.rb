module TicTacToe
  module Strategy
    class FirstMove
      include ::TicTacToe::Strategy::Tactics

      def initialize(game, player)
        @game = game
        @player = player
      end

      def applicable?
        game.turn_count == 0 && game.current_player == player
      end

      def select_position
        take_corner if applicable?
      end

      private

      attr_reader :game, :player
    end
  end
end
