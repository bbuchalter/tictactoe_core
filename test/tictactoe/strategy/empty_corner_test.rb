require_relative '../../test_helper'
require 'tictactoe/strategy/empty_corner'
require 'tictactoe/game'

class EmptyCornerStrategyTest < Minitest::Test
  def test_applicable?
    game = new_game_with_computer_players
    assert_equal true, applicable?(game)
    make_tie_game_moves(game)
    assert_equal false, applicable?(game)
  end

  def test_select_position
    game = new_game_with_computer_players
    assert_equal 1, select_position(game)
    position_player_one_to_take_last_corner(game)
    assert_equal 9, select_position(game)
  end

  def test_select_position_when_not_applicable
    game = new_game_with_computer_players
    make_tie_game_moves(game)
    assert_equal nil, select_position(game)
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::GameTestHelpers

  def applicable?(game)
    empty_corner(game).applicable?
  end

  def select_position(game)
    empty_corner(game).select_position
  end

  def empty_corner(game)
    ::TicTacToe::Strategy::EmptyCorner.new(game)
  end
end
