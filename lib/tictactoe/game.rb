require 'tictactoe/board'

module TicTacToe
  class Game
    attr_reader :turn_count

    def initialize
      @board = ::TicTacToe::Board.new
      @players = []
      @turn_count = 0
    end

    def make_move(position, player)
      board.new_move_for(position, ::TicTacToe::Position.new(position, player))
      self.turn_count = turn_count + 1
      self.last_move_by = player
    end

    def setup_player(type, symbol, color)
      players << ::TicTacToe::Player.class_for(type).new(symbol, color)
    end

    def player_one
      players[0]
    end

    def player_two
      players[1]
    end

    def game_over?
      winner? || draw?
    end

    def winner?
      three_positions_in_row_from_same_player?
    end

    def draw?
      no_positions_available?
    end

    def move_at(position)
      board.at(position)
    end

    def current_player
      last_move_by == player_one ? player_two : player_one
    end

    def board_state
      board.reduce({}) do |state, position|
        at = position.position.to_s
        state[at] = position.empty? ? {} : position.player.to_hash
        state
      end
    end

    private

    attr_reader :board
    attr_writer :turn_count
    attr_accessor :players, :last_move_by

    def three_positions_in_row_from_same_player?
      board.tuples.any? { |tuple| tuple.all_for_same_player? }
    end

    def no_positions_available?
      board.none?(&:empty?)
    end
  end
end
