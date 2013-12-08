module TicTacToe
  module Strategy
    class WinNow
      def initialize(game)
        @game = game
        @applicable_tuple = nil
      end

      def applicable?
        self.applicable_tuple = game.two_for_same_player_and_one_empty
        !applicable_tuple.nil?
      end

      def select_position
        return nil unless applicable_tuple || applicable?
        empty_position = applicable_tuple.find { |position| position.empty? }
        empty_position.position
      end

      private

      attr_reader :game
      attr_accessor :applicable_tuple
    end
  end
end
