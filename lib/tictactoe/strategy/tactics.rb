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
    end
  end
end
