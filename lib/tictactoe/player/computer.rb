require 'tictactoe/player'
require 'tictactoe/strategy'

module TicTacToe
  module Player
    class Computer
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
          ::TicTacToe::Strategy::WinNow, ::TicTacToe::Strategy::BlockWin,
          ::TicTacToe::Strategy::Fork, ::TicTacToe::Strategy::BlockFork,
          ::TicTacToe::Strategy::FirstMove, ::TicTacToe::Strategy::SecondMove,
          ::TicTacToe::Strategy::OppositeCorner,
          ::TicTacToe::Strategy::EmptyCorner,
          ::TicTacToe::Strategy::EmptySide
        ]
      end

      class CannotSelectPosition < RuntimeError
      end
    end
  end
end
