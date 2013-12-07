module TicTacToe
  class Game
    module Players
      def setup_player(type, symbol, color)
        players << ::TicTacToe::Player.class_for(type).new(symbol, color)
      end

      def player_one
        players[0]
      end

      def player_two
        players[1]
      end
    end
  end
end
