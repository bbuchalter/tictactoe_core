require 'tictactoe/player'
require 'tictactoe/strategy'

module TicTacToe
  class ComputerPlayer
    include ::TicTacToe::Player

    def select_position(game)
      strategy = applicable_strategy(game)
      fail CannotSelectPosition if strategy.nil?
      strategy.new(game, self).select_position
    end

    def human?
      false
    end

    private

    def applicable_strategy(game)
      strategies.find do |strategy|
        strategy.new(game, self).applicable?
      end
    end

    def strategies
      [
          ::TicTacToe::Strategy::WinOrBlock,
          ::TicTacToe::Strategy::Fork,
          ::TicTacToe::Strategy::BlockFork,
          ::TicTacToe::Strategy::FirstMove,
          ::TicTacToe::Strategy::SecondMove
      ]
    end

    class CannotSelectPosition < RuntimeError
    end
  end
end
