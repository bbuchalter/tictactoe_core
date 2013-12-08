require_relative '../../test_helper'
require 'tictactoe/game'
require 'tictactoe/strategy/win_or_block'

class WinOrBlockTest < Minitest::Test
  def test_applicable_when_applicable
    game = new_game_with_players
    position_player_one_for_win(game)
    assert win_or_block_strategy(game).applicable?
  end

  def test_applicable_when_not_applicable
    game = new_game_with_players
    assert_equal false, win_or_block_strategy(game).applicable?
  end

  def test_select_position_when_applicable
    game = new_game_with_players
    position_player_one_for_win(game)
    assert_equal 3, win_or_block_strategy(game).select_position
  end

  def test_select_position_when_not_applicable
    game = new_game_with_players
    assert_equal nil, win_or_block_strategy(game).select_position
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::GameTestHelpers
end
