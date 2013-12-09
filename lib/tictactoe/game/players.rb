require 'tictactoe/player/human'
require 'tictactoe/player/computer'

module TicTacToe
  class Game
    module Players
      def setup_player(type, symbol, color)
        players << player_class_for(type).new(symbol, color)
      end

      def player_one
        players[0]
      end

      def player_two
        players[1]
      end

      private

      def player_class_for(type)
        case type
          when :human
            ::TicTacToe::HumanPlayer
          when :computer
            ::TicTacToe::ComputerPlayer
        end
      end
    end
  end
end
