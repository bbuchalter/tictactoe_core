require_relative '../../test_helper'
require 'tictactoe/strategy/tactics'
require 'tictactoe/strategy/fork'
require 'tictactoe/game'

class ForkStrategyTest < Minitest::Test
  def test_applicable?
    game = new_game_with_computer_players
    assert_equal false, applicable?(game, game.player_one)
    position_player_one_to_fork(game)
    assert_equal true, applicable?(game, game.player_one)
  end

  def test_select_position_when_not_applicable
    game = new_game_with_computer_players
    assert_equal nil, select_position(game, game.player_one)
  end

  def test_select_position_when_applicable
    game = new_game_with_computer_players
    position_player_one_to_fork(game)
    assert_equal 3, select_position(game, game.player_one)
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::GameTestHelpers

  def applicable?(game, player)
    threaten_strategy(game, player).applicable?
  end

  def select_position(game, player)
    threaten_strategy(game, player).select_position
  end

  def threaten_strategy(game, player)
    ::TicTacToe::Strategy::Fork.new(game, player)
  end
end
