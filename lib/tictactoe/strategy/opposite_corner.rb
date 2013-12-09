module TicTacToe
  module Strategy
    class OppositeCorner
      def initialize(game, player = nil)
        @game = game
      end

      def applicable?
        game.previous_move_in_corner? && opposite_corner.empty?
      end

      def select_position
        opposite_position
      end

      private

      attr_reader :game

      include ::TicTacToe::Strategy::Tactics
    end
  end
end
