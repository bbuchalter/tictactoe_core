require_relative '../../test_helper'
require 'tictactoe/strategy/empty_side'
require 'tictactoe/game'

class EmptySideStrategyTest < Minitest::Test
  def test_applicable?
    game = new_game_with_computer_players
    assert_equal true, applicable?(game)
    take_all_side_moves(game)
    assert_equal false, applicable?(game)
  end

  def test_select_position_when_not_applicable
    game = new_game_with_computer_players
    take_all_side_moves(game)
    assert_equal nil, select_position(game)
  end

  def test_select_position
    game = new_game_with_computer_players
    assert_equal 2, select_position(game)
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::GameTestHelpers

  def applicable?(game)
    empty_side(game).applicable?
  end

  def select_position(game)
    empty_side(game).select_position
  end

  def empty_side(game)
    ::TicTacToe::Strategy::EmptySide.new(game)
  end
end
