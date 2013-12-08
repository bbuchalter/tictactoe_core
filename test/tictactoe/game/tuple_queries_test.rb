require_relative '../../test_helper'
require 'tictactoe/game'

class TupleQueriesTest < Minitest::Test
  def test_three_positions_in_row_for_same_player?
    game = new_game_with_players
    assert_equal false, game.three_for_same_player?

    make_winning_moves(game)
    assert_equal true, game.three_for_same_player?
  end

  def test_no_positions_available?
    game = new_game_with_players
    assert_equal false, game.no_positions_available?
    make_tie_game_moves(game)
    assert_equal true, game.no_positions_available?
  end

  def test_two_positions_in_row_for_same_player_and_one_empty
    game = new_game_with_players
    assert_equal nil, game.two_for_same_player_and_one_empty

    one_move_away_from_win(game)
    tuple = game.two_for_same_player_and_one_empty
    assert_equal 1, tuple[0].position
    assert_equal 2, tuple[1].position
    assert_equal 3, tuple[2].position
  end

  private

  include TicTacToe::ObjectCreationMethods
  include TicTacToe::GameTestHelpers
end
