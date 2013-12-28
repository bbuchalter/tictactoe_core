require_relative '../../test_helper'
require 'tictactoe/game'

class GamePlayersTest < Minitest::Test
  def test_setup_player_one
    game = new_game
    assert_equal nil, game.player_one

    game.setup_player(:human, 'X', :blue)
    game.setup_player(:computer, 'O', :green)
    assert_equal ::TicTacToe::Player::Human, game.player_one.class
    assert_equal 'X', game.player_one.symbol
    assert_equal :blue, game.player_one.color
  end

  def test_setup_player_two
    game = new_game
    assert_equal nil, game.player_two

    game.setup_player(:human, 'X', :blue)
    game.setup_player(:computer, 'O', :green)
    assert_equal ::TicTacToe::Player::Computer, game.player_two.class
    assert_equal 'O', game.player_two.symbol
    assert_equal :green, game.player_two.color
  end

  def test_opponent
    game = new_game_with_players
    assert_equal game.player_one, game.opponent(game.player_two)
    assert_equal game.player_two, game.opponent(game.player_one)
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::GameTestHelpers
end
