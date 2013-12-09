module TicTacToe
  class Game
    module ChangeState
      def make_move(position, player)
        new_move = ::TicTacToe::Position.new(position, player)
        board.new_move_for(position, new_move)
        self.turn_count = turn_count + 1
        move_history << new_move
      end

      def reset
        initialize_board
        initialize_turn_count
        initialize_previous_move
      end
    end
  end
end
