module TicTacToe
  class Game
    module Outcomes
      def game_over?
        winner? || draw?
      end

      def winner?
        three_for_same_player?
      end

      def draw?
        no_positions_available? && !winner?
      end

      def winner
        return nil unless winner?
        winning_tuple[0].player
      end
    end
  end
end
