module TicTacToe
  module Strategy
    module Tactics
      def take_center
        5
      end

      alias_method :center, :take_center

      def take_corner
        1
      end

      def take_side
        2
      end

      def threatening_position_for(player)
        game.empty_positions.find do |possible_threat|
          possible_game = game.deep_clone
          possible_game.make_move(possible_threat, player)
          possible_game.two_threats_by?(player)
        end
      end
    end
  end
end
