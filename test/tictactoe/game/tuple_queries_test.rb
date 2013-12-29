require_relative '../../test_helper'
require 'tictactoe/game'

class TupleQueriesTest < Minitest::Test
  def test_three_positions_in_row_for_same_player?
    game = new_game_with_players
    assert_equal false, game.three_for_same_player?

    make_winning_moves(game)
    assert_equal true, game.three_for_same_player?
  end

  def test_winning_tuple
    game = new_game_with_players
    assert_equal nil, game.winning_tuple

    make_winning_moves(game)
    winning_tuple = game.winning_tuple
    assert_equal 1, winning_tuple[0].position
    assert_equal 2, winning_tuple[1].position
    assert_equal 3, winning_tuple[2].position
  end

  def test_no_positions_available?
    game = new_game_with_players
    assert_equal false, game.no_positions_available?
    make_draw(game)
    assert_equal true, game.no_positions_available?
  end

  def test_threat_for
    game = new_game_with_players
    assert_equal nil, game.threat_for(game.player_one)
    assert_equal nil, game.threat_for(game.player_two)

    one_move_away_from_win(game)
    player_one_tuple = game.threat_for(game.player_one)
    assert_equal 1, player_one_tuple[0].position
    assert_equal 2, player_one_tuple[1].position
    assert_equal 3, player_one_tuple[2].position

    player_two_tuple = game.threat_for(game.player_two)
    assert_equal nil, player_two_tuple
  end

  def test_threats_for
    game = new_game_with_players
    assert_equal [], game.threats_for(game.player_one)
    assert_equal [], game.threats_for(game.player_two)

    game = game_with_moves(%w(1 5 9 7 3))
    threats = game.threats_for(game.player_one)
    assert_equal 2, threats.count
  end

  def test_opportunities_for
    game = new_game_with_players
    assert_equal [], game.threats_for(game.player_one)
    assert_equal [], game.threats_for(game.player_two)

    game = game_with_moves(%w(1))
    opportunities = game.opportunities_for(game.player_one)
    assert_equal 3, opportunities.count

    game = game_with_moves(%w(1 2))
    opportunities = game.opportunities_for(game.player_one)
    assert_equal 2, opportunities.count
  end

  private

  include TicTacToe::ObjectCreationMethods
  include TicTacToe::GameTestHelpers
end
