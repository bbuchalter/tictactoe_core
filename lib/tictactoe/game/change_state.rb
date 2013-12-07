module TicTacToe
  class Game
    module ChangeState
      def make_move(position, player)
        new_move = ::TicTacToe::Position.new(position, player)
        board.new_move_for(position, new_move)
        self.turn_count = turn_count + 1
        self.previous_move_by = player
      end

      def reset
        initialize_board
        initialize_turn_count
        initialize_previous_move_by
      end
    end
  end
end
