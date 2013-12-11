module TicTacToe
  module Strategy
    class BlockFork
      def initialize(game, player)
        @game = game
        @player = player
      end

      def applicable?
        !force_block_without_opportunity_to_fork.nil? &&
            game.player_made_at_least_two_moves?(game.opponent(player))
      end

      def select_position
        force_block_without_opportunity_to_fork if applicable?
      end

      private

      attr_reader :game, :player

      include ::TicTacToe::Strategy::Tactics

      def force_block_without_opportunity_to_fork
        confirmed_threats do |possible_game, position_of_forced_block|
          opponent = possible_game.opponent(player)
          position_of_forced_block != fork_for(possible_game, opponent)
        end
      end

      def confirmed_threats(&block)
        game.empty_positions.find do |possible_threat|
          possible_game = game.deep_clone
          possible_game.make_move(possible_threat, player)

          threatening_tuple = possible_game.threat_for(player)
          confirmed_threat = possible_threat unless threatening_tuple.nil?

          if confirmed_threat
            forced_block = threatening_tuple.find(&:empty?).position
            yield(possible_game, forced_block)
          end
        end
      end
    end
  end
end
