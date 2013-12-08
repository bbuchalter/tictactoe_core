module TicTacToe
  class Game
    module TupleQueries
      def three_for_same_player?
        board.tuples.any? { |tuple| tuple.all_for_same_player? }
      end

      def no_positions_available?
        board.none?(&:empty?)
      end

      def two_for_same_player_and_one_empty
        board.tuples.find do |tuple|
          tuple.two_for_same_player? && tuple.one_empty?
        end
      end
    end
  end
end
