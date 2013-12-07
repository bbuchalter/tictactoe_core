module TicTacToe
  class Game
    module QueryState
      def move_at(position)
        board.at(position)
      end

      def board_state
        board.reduce({}) do |state, position|
          at = position.at.to_s
          state[at] = position.empty? ? {} : position.player.to_hash
          state
        end
      end

      def current_player
        previous_move_by == player_one ? player_two : player_one
      end

      def previous_move_by
        turn_count == 0 ? nil : @previous_move_by
      end
    end
  end
end
