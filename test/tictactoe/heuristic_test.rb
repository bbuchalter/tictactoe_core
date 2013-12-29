require_relative '../test_helper'
require 'tictactoe/heuristic'
require 'tictactoe/game'

class HeuristicEvalTest < Minitest::Test
  def test_winning_game_for_player_one
    moves = %w(1 4 2 9 3)
    assert_equal Float::INFINITY, heuristic(game_with_moves(moves))
  end

  def test_one_threat_for_player_one
    moves = %w(1 4 2 9)
    assert_equal 10, heuristic(game_with_moves(moves))
  end

  def test_two_threats_for_player_one
    moves = %w(1 5 9 7 3)
    assert_equal 20, heuristic(game_with_moves(moves))
  end

  def test_opportunities_for_player
    assert_equal 3, heuristic(game_with_moves(%w(1)))
    assert_equal 2, heuristic(game_with_moves(%w(1 2)))
  end

  def test_empty_game
    assert_equal 0, heuristic(game_with_moves([]))
  end

  def test_draw_game
    assert_equal 0, heuristic(game_with_moves(%w(1 4 2 5 6 3 7 8 9)))
  end

  private

  include TicTacToe::ObjectCreationMethods

  def heuristic(game)
    ::TicTacToe::Heuristic.new(game).evaluate
  end
end
