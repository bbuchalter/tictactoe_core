module TicTacToe
  class Game
    module ChangeState
      def make_move(position, player)
        position = position.to_i
        new_move = ::TicTacToe::Position.new(position, player)
        board.new_move_for(position, new_move)
        self.turn_count = turn_count + 1
        move_history << new_move
        self
      end

      def undo_previous_move
        board.clear_move(previous_move_position)
        self.turn_count = turn_count - 1
        move_history.pop
        self
      end

      def reset
        initialize_board
        initialize_turn_count
        initialize_move_history
      end
    end
  end
end
