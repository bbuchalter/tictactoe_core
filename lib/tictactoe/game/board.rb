module TicTacToe
  class Game
    module Board
      def move_at(position)
        board.at(position)
      end

      def board_state
        board.reduce({}) do |state, position|
          at = position.at.to_s
          state[at] = position.empty? ? nil : position.player.symbol
          state
        end
      end

      def corners
        board.corners
      end

      def sides
        board.sides
      end
    end
  end
end
