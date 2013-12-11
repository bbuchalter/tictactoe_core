require_relative '../../test_helper'
require 'tictactoe/game'
require 'tictactoe/strategy/win_now'

class WinNowStrategyTest < Minitest::Test
  def test_applicable_when_applicable
    game = new_game_with_players
    position_player_one_for_win(game)
    assert win_now_strategy(game, game.player_one).applicable?
  end

  def test_applicable_when_not_applicable
    game = new_game_with_players
    assert_equal false, win_now_strategy(game, game.player_one).applicable?
  end

  def test_select_position_when_applicable
    game = new_game_with_players
    position_player_one_for_win(game)
    assert_equal 3, win_now_strategy(game, game.player_one).select_position
  end

  def test_select_position_when_not_applicable
    game = new_game_with_players
    assert_equal nil, win_now_strategy(game, game.player_one).select_position
  end

  def test_select_position_when_multiple_threats
    game = new_game_with_players
    game.make_move(9, game.player_one)
    game.make_move(5, game.player_two)
    game.make_move(7, game.player_one)
    game.make_move(8, game.player_two)
    game.make_move(2, game.player_one)
    game.make_move(4, game.player_two)
    game.make_move(3, game.player_one)
    assert_equal 6, win_now_strategy(game, game.player_two).select_position
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::GameTestHelpers
end
