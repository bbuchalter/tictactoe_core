require_relative '../test_helper'
require 'tictactoe/negamax'
require 'tictactoe/game'

class NegamaxTest < Minitest::Test
  def test_winning_game_for_player_one
    game = game_with_moves(%w(1 4 2 9 3))
    assert_equal nil, negamax(game, 0, 1)
  end

  def test_winning_game_for_player_two
    game = game_with_moves(%w(1 4 2 9 3))
    assert_equal nil, negamax(game, 0, -1)
  end

  def test_invalid_player
    assert_raises Negamax::InvalidPlayer do
      negamax(new_game, 0, 'player')
    end
  end

  def test_one_threat_for_player_one_looking_one_move
    game = game_with_moves(%w(1 4 2 9))
    assert_equal(3, negamax(game, 1, 1))
  end

  def test_one_threat_for_player_two_looking_many_moves
    game = game_with_moves(%w(1 4 2 9))
    assert_equal 3, negamax(game, 10, -1)
  end

  private

  include ::TicTacToe::ObjectCreationMethods

  def infinity
    Float::INFINITY
  end

  def negative_infinity
    -1 / 0.0
  end

  def negamax(game, depth, player)
    negamax = Negamax.new(game, depth, player)
    negamax.evaluate
    game.ai_move
  end
end
