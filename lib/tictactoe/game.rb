require 'tictactoe/board'
require 'tictactoe/game/players'
require 'tictactoe/game/outcomes'
require 'tictactoe/game/query_state'
require 'tictactoe/game/change_state'
require 'tictactoe/game/tuple_queries'
require 'tictactoe/game/board'

module TicTacToe
  class Game
    include ::TicTacToe::Game::Players
    include ::TicTacToe::Game::Outcomes
    include ::TicTacToe::Game::QueryState
    include ::TicTacToe::Game::ChangeState
    include ::TicTacToe::Game::TupleQueries
    include ::TicTacToe::Game::Board

    attr_reader :turn_count

    def initialize(player_one = nil, player_two = nil, move_history = nil)
      initialize_board
      initialize_players(player_one, player_two)
      initialize_turn_count
      initialize_move_history(move_history)
    end

    def deep_clone
      ::TicTacToe::Game.new(player_one, player_two, move_history)
    end

    private

    attr_accessor :players, :move_history
    attr_reader :board
    attr_writer :turn_count

    def initialize_board
      @board = ::TicTacToe::Board.new
    end

    def initialize_players(player_one, player_two)
      @players = []
      @players << player_one if player_one
      @players << player_two if player_two
    end

    def initialize_turn_count
      @turn_count = 0
    end

    def initialize_move_history(move_history = nil)
      @move_history = []
      replay_move_history(move_history) if move_history
    end

    def replay_move_history(move_history)
      move_history.each do |move|
        make_move(move.position, move.player)
      end
    end
  end
end
