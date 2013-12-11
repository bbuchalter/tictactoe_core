require_relative '../../test_helper'
require 'tictactoe/strategy/tactics'
require 'tictactoe/strategy/block_fork'
require 'tictactoe/game'

class BlockForkStrategyTest < Minitest::Test
  def test_applicable?
    game = new_game_with_computer_players
    assert_equal false, applicable?(game, game.player_two)
    position_player_two_to_block_fork(game)
    assert_equal true, applicable?(game, game.player_two)

    game = new_game_with_computer_players
    position_player_two_to_block_fork_without_center(game)
    assert_equal true, applicable?(game, game.player_two)
  end

  def test_select_position_when_applicable
    game = new_game_with_computer_players
    position_player_two_to_block_fork(game)
    assert_equal 2, select_position(game, game.player_two)

    game = new_game_with_computer_players
    position_player_two_to_block_fork_without_center(game)
    assert_equal 3, select_position(game, game.player_two)
  end

  def test_select_position_when_not_applicable
    game = new_game_with_computer_players
    assert_equal nil, select_position(game, game.player_two)
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::GameTestHelpers

  def applicable?(game, player)
    block_fork_strategy(game, player).applicable?
  end

  def select_position(game, player)
    block_fork_strategy(game, player).select_position
  end

  def block_fork_strategy(game, player)
    ::TicTacToe::Strategy::BlockFork.new(game, player)
  end
end
