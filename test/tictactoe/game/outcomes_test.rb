require_relative '../../test_helper'
require 'tictactoe/game'

class GameOutcomesTest < Minitest::Test
  def test_game_over_with_winner
    game = new_game_with_players
    assert_equal false, game.game_over?
    assert_equal false, game.draw?
    assert_equal false, game.winner?

    make_winning_moves(game)
    assert_equal true, game.game_over?
    assert_equal true, game.winner?
    assert_equal false, game.draw?
  end

  def test_game_over_with_draw
    game = new_game_with_players
    assert_equal false, game.game_over?
    assert_equal false, game.draw?
    assert_equal false, game.winner?

    make_tie_game_moves(game)
    assert_equal true, game.game_over?
    assert_equal true, game.draw?
    assert_equal false, game.winner?
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::GameTestHelpers
end
