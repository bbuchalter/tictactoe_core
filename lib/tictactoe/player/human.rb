require 'tictactoe/player'

module TicTacToe
  module Player
    class Human
      include ::TicTacToe::Player

      def human?
        true
      end
    end
  end
end
