module TicTacToe
  class Game
    module QueryState
      def current_player
        previous_move_player == player_one ? player_two : player_one
      end

      def previous_move_player
        turn_count == 0 ? nil : previous_move.player
      end

      def previous_move_position
        turn_count == 0 ? nil : previous_move.position
      end

      def empty_positions
        empty_positions = board.select(&:empty?)
        empty_positions.map(&:at)
      end

      def two_threats_by?(player)
        threat_count = board.tuples.count do |tuple|
          tuple.two_for?(player) && tuple.one_empty?
        end
        threat_count == 2
      end

      def previous_move_in_corner?
        previous_move.nil? ? false : previous_move.corner?
      end

      def player_made_at_least_two_moves?(player)
        move_history.count { |move| move.player == player } >= 2
      end

      private

      def previous_move
        move_history[-1]
      end
    end
  end
end
