module TicTacToe
  module Strategy
    class EmptyCorner
      def initialize(game, player = nil)
        @game = game
      end

      def applicable?
        !empty_corner.nil?
      end

      def select_position
        empty_corner.position if applicable?
      end

      private

      attr_reader :game

      include ::TicTacToe::Strategy::Tactics
    end
  end
end
