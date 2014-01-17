require_relative '../test_helper'
require 'tictactoe/heuristic'
require 'tictactoe/game'

class HeuristicEvalTest < Minitest::Test
  def test_winning_game_for_player_one
    game = game_with_moves(%w(1 4 2 9 3))
    assert_equal Float::INFINITY, heuristic(game, game.player_one)
    assert_equal -Float::INFINITY, heuristic(game, game.player_two)
  end

  def test_one_threat_for_player_one
    game = game_with_moves(%w(1 4 2 9))
    assert_equal 10, heuristic(game, game.player_one)
    assert_equal -10, heuristic(game, game.player_two)
  end

  def test_two_threats_for_player_one
    game = game_with_moves(%w(1 5 9 7 3))
    assert_equal 20, heuristic(game, game.player_one)
    assert_equal -20, heuristic(game, game.player_two)
  end

  def test_opportunities_for_player
    game = game_with_moves(%w(1))
    assert_equal 3, heuristic(game, game.player_one)
    assert_equal -3, heuristic(game, game.player_two)

    game = game_with_moves(%w(1 2))
    assert_equal 2, heuristic(game, game.player_one)
    assert_equal -2, heuristic(game, game.player_two)
  end

  def test_empty_game
    game = game_with_moves([])
    assert_equal 0, heuristic(game, game.player_one)
    assert_equal 0, heuristic(game, game.player_two)
  end

  def test_draw_game
    game = draw_game
    assert_equal 0, heuristic(game, game.player_one)
    assert_equal 0, heuristic(game, game.player_two)
  end

  private

  include TicTacToe::ObjectCreationMethods
  include TicTacToe::GameTestHelpers

  def heuristic(game, player)
    ::TicTacToe::Heuristic.new(game, player).evaluate
  end
end
