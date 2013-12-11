module TicTacToe
  class Game
    module TupleQueries
      def three_for_same_player?
        !winning_tuple.nil?
      end

      def winning_tuple
        board.tuples.find { |tuple| tuple.all_for_same_player? }
      end

      def no_positions_available?
        board.none?(&:empty?)
      end

      def threat_for(player)
        board.tuples.find do |tuple|
          tuple.two_for?(player) && tuple.one_empty?
        end
      end
    end
  end
end
