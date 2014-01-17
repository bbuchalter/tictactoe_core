require 'tictactoe/player'
require 'tictactoe/strategy'
require 'tictactoe/negamax'

module TicTacToe
  module Player
    class Computer
      include ::TicTacToe::Player

      def select_position(game)
        #strategy = applicable_strategy(game)
        #fail CannotSelectPosition if strategy.nil?
        #strategy.new(game, self).select_position
        position = negamax(game, 10, negamax_player(game))
        fail CannotSelectPosition if position.nil?
        position
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

      def negamax(game, depth, player)
        negamax = Negamax.new(game, depth, player)
        negamax.evaluate
        game.ai_move
      end

      def negamax_player(game)
        game.current_player == game.player_one ? 1 : -1
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
