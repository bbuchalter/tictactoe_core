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

      def opponent(other)
        player_one == other ? player_two : player_one
      end

      private

      def player_class_for(type)
        case type
          when :human
            ::TicTacToe::Player::Human
          when :computer
            ::TicTacToe::Player::Computer
        end
      end
    end
  end
end
