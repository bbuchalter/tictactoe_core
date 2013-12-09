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

      def opposite_corner
        game.move_at(opposite_position)
      end

      def opposite_position
        case game.previous_move_position
          when 1
            9
          when 3
            7
          when 7
            3
          when 9
            1
        end
      end
    end
  end
end
