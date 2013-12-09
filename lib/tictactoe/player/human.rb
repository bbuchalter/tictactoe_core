require 'tictactoe/player'

module TicTacToe
  class HumanPlayer
    include ::TicTacToe::Player

    def human?
      true
    end
  end
end
