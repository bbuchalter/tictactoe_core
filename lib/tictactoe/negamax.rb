require 'tictactoe/heuristic'

class Negamax
  def initialize(game, depth, player)
    @player = player
    validate_player

    @game = game
    @depth = depth
    @best_score = negative_infinity
  end

  def evaluate
    return score if ready_to_score?

    possible_moves.each do |position|
      evaluate_position(position)
    end

    best_score
  end

  private

  attr_reader :game, :player, :depth
  attr_accessor :best_score

  def evaluate_position(position)
    child_score = Negamax.new(make_move(position),
                              depth - 1,
                              other_player).evaluate * -1
    undo_move

    if child_score > best_score
      self.best_score = child_score
      game.ai_move = position
    end
  end

  def validate_player
    fail InvalidPlayer unless [1, -1].include?(player)
  end

  def ready_to_score?
    depth == 0 || game_over?
  end

  def game_over?
    game.game_over?
  end

  def possible_moves
    game.empty_positions
  end

  def other_player
    player * -1
  end

  def negative_infinity
    -1 / 0.0
  end

  def make_move(position)
    game.make_move(position, current_player)
  end

  def current_player
    player == 1 ? game.player_one : game.player_two
  end

  def undo_move
    game.undo_previous_move
  end

  def score
    ::TicTacToe::Heuristic.new(game, current_player).evaluate * player
  end

  class InvalidPlayer < RuntimeError
  end
end
