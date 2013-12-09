require_relative '../../test_helper'
require 'tictactoe/game'
require 'tictactoe/strategy/first_move'

class FirstMoveStrategyTest < Minitest::Test
  def test_applicable?
    game = new_game_with_computer_players
    assert_equal true, applicable?(game, game.player_one)
    assert_equal false, applicable?(game, game.player_two)

    game.make_move(1, game.player_one)
    assert_equal false, applicable?(game, game.player_one)
    assert_equal false, applicable?(game, game.player_two)
  end

  def test_select_position_when_applicable
    game = new_game_with_computer_players
    assert_equal 1, select_position(game, game.player_one)
  end

  def test_select_position_when_not_applicable
    game = new_game_with_computer_players
    assert_equal nil, select_position(game, game.player_two)
  end

  private

  def applicable?(game, player)
    first_move_mine_strategy(game, player).applicable?
  end

  def select_position(game, player)
    first_move_mine_strategy(game, player).select_position
  end

  include ::TicTacToe::ObjectCreationMethods
end
