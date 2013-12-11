module TicTacToe
  module Strategy
    class WinOrBlock
      def initialize(game, player = nil)
        @game = game
        @applicable_tuple = nil
      end

      def applicable?
        self.applicable_tuple = game.threatening_tuple
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
