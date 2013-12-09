module TicTacToe
  module Strategy
    class EmptySide
      def initialize(game, player = nil)
        @game = game
      end

      def applicable?
        !empty_side.nil?
      end

      def select_position
        empty_side.position if applicable?
      end

      private

      attr_reader :game

      include ::TicTacToe::Strategy::Tactics
    end
  end
end
