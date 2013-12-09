require_relative '../../test_helper'
require 'tictactoe/game'
require 'tictactoe/strategy/second_move'

class SecondMoveMineStrategy < Minitest::Test
  def test_applicable
    game = new_game_with_computer_player_two
    assert_equal false, applicable?(game, game.player_one)
    assert_equal false, applicable?(game, game.player_two)

    game.make_move(1, game.player_one)
    assert_equal false, applicable?(game, game.player_one)
    assert_equal true, applicable?(game, game.player_two)
  end

  def test_select_position_when_previous_move_center
    game = new_game_with_computer_player_two
    game.make_move(5, game.player_one)
    assert_equal 1, select_position(game, game.player_two)
  end

  def test_selection_position_when_previous_move_not_center
    game = new_game_with_computer_player_two
    game.make_move(1, game.player_one)
    assert_equal 5, select_position(game, game.player_two)
  end

  def test_select_position_when_not_applicable
    game = new_game_with_computer_player_two
    assert_equal nil, select_position(game, game.player_two)
  end

  private

  include ::TicTacToe::ObjectCreationMethods

  def applicable?(game, player)
    second_move_strategy(game, player).applicable?
  end

  def second_move_strategy(game, player)
    ::TicTacToe::Strategy::SecondMove.new(game, player)
  end

  def select_position(game, player)
    second_move_strategy(game, player).select_position
  end
end
