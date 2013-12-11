module TicTacToe
  module Strategy
    class WinNow
      def initialize(game, player)
        @game = game
        @player = player
        @applicable_tuple = nil
      end

      def applicable?
        self.applicable_tuple = game.threat_for(player)
        !applicable_tuple.nil?
      end

      def select_position
        return nil unless applicable_tuple || applicable?
        empty_position = applicable_tuple.find { |position| position.empty? }
        empty_position.position
      end

      private

      attr_reader :game, :player
      attr_accessor :applicable_tuple
    end
  end
end
