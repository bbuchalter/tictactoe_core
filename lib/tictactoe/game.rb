require 'tictactoe/board'
require 'tictactoe/game/players'
require 'tictactoe/game/outcomes'
require 'tictactoe/game/query_state'
require 'tictactoe/game/change_state'

module TicTacToe
  class Game
    include ::TicTacToe::Game::Players
    include ::TicTacToe::Game::Outcomes
    include ::TicTacToe::Game::QueryState
    include ::TicTacToe::Game::ChangeState

    attr_reader :turn_count

    def initialize
      initialize_board
      initialize_players
      initialize_previous_move_by
      initialize_turn_count
    end

    private

    attr_accessor :players
    attr_reader :board
    attr_writer :turn_count, :previous_move_by

    def initialize_board
      @board = ::TicTacToe::Board.new
    end

    def initialize_players
      @players = []
    end

    def initialize_previous_move_by
      @previous_move_by = nil
    end

    def initialize_turn_count
      @turn_count = 0
    end
  end
end
