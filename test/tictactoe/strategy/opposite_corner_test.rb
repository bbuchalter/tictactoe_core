require_relative '../../test_helper'
require 'tictactoe/strategy/opposite_corner'
require 'tictactoe/game'

class OppositeCornerStrategyTest < Minitest::Test
  def test_applicable_when_previous_move_not_corner
    game = new_game_with_computer_players
    assert_equal false, applicable?(game)
    game.make_move(2, game.player_one)
    assert_equal false, applicable?(game)
  end

  def test_applicable_when_previous_move_in_corner
    game = new_game_with_computer_players
    assert_equal false, applicable?(game)
    game.make_move(1, game.player_one)
    assert_equal true, applicable?(game)
  end

  def test_applicable_when_previous_move_in_corner_but_opposite_taken
    game = new_game_with_computer_players
    game.make_move(1, game.player_one)
    game.make_move(9, game.player_two)
    assert_equal false, applicable?(game)
  end

  def test_select_position_top_left_corner
    game = new_game_with_computer_players
    game.make_move(1, game.player_one)
    assert_equal 9, select_position(game)
  end

  def test_select_position_top_right_corner
    game = new_game_with_computer_players
    game.make_move(9, game.player_one)
    assert_equal 1, select_position(game)
  end

  def test_select_position_bottom_right_corner
    game = new_game_with_computer_players
    game.make_move(3, game.player_one)
    assert_equal 7, select_position(game)
  end

  def test_select_position_bottom_left_corner
    game = new_game_with_computer_players
    game.make_move(7, game.player_one)
    assert_equal 3, select_position(game)
  end

  def test_select_position_when_not_applicable
    game = new_game_with_computer_players
    assert_equal nil, select_position(game)
  end

  private

  include ::TicTacToe::ObjectCreationMethods

  def applicable?(game)
    opposite_corner(game).applicable?
  end

  def select_position(game)
    opposite_corner(game).select_position
  end

  def opposite_corner(game)
    ::TicTacToe::Strategy::OppositeCorner.new(game)
  end
end
