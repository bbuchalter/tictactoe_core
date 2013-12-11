module TicTacToe
  module Strategy
    module Tactics
      private

      def take_center
        5
      end

      alias_method :center, :take_center

      def take_corner
        empty_corner.position
      end

      def fork_for(game, player)
        game.empty_positions.find do |possible_threat|
          possible_game = game.deep_clone
          possible_game.make_move(possible_threat, player)
          possible_game.two_threats_by?(player)
        end
      end

      def empty_side
        game.sides.find(&:empty?)
      end

      def empty_corner
        game.corners.find(&:empty?)
      end

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
