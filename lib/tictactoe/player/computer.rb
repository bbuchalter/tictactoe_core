require 'tictactoe/player'

module TicTacToe
  class ComputerPlayer
    include ::TicTacToe::Player

    def select_position(game)
      strategy = applicable_strategy(game)
      fail CannotSelectPosition if strategy.nil?
      strategy.new(game).select_position
    end

    def human?
      false
    end

    private

    def applicable_strategy(game)
      strategies.find do |strategy|
        strategy.new(game).applicable?
      end
    end

    def strategies
      [
          ::TicTacToe::Strategy::WinOrBlock
      ]
    end

    class CannotSelectPosition < RuntimeError
    end
  end
end
