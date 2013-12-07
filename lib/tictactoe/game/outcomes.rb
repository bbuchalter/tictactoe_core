module TicTacToe
  class Game
    module Outcomes
      def game_over?
        winner? || draw?
      end

      def winner?
        three_positions_in_row_from_same_player?
      end

      def draw?
        no_positions_available?
      end

      private

      def three_positions_in_row_from_same_player?
        board.tuples.any? { |tuple| tuple.all_for_same_player? }
      end

      def no_positions_available?
        board.none?(&:empty?)
      end
    end
  end
end
