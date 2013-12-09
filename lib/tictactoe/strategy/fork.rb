module TicTacToe
  module Strategy
    class Fork
      def initialize(game, player)
        @game = game
        @player = player
      end

      def applicable?
        !threatening_position.nil?
      end

      def select_position
        threatening_position
      end

      private

      attr_reader :game, :player

      def threatening_position
        game.empty_positions.find do |possible_threat|
          possible_game = game.deep_clone
          possible_game.make_move(possible_threat, player)
          possible_game.two_threats_by?(player)
        end
      end
    end
  end
end
