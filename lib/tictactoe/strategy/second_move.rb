module TicTacToe
  module Strategy
    class SecondMove
      def initialize(game, player)
        @game = game
        @player = player
      end

      def applicable?
        game.turn_count == 1 && game.current_player == player
      end

      def select_position
        return nil unless applicable?
        game.previous_move_position == center ? take_corner : take_center
      end

      private

      attr_reader :game, :player

      include ::TicTacToe::Strategy::Tactics
    end
  end
end
