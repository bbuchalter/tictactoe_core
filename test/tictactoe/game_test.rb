require_relative '../test_helper'
require 'tictactoe/game'

class GameTest < Minitest::Test
  def test_new_game_has_empty_board
    game = new_game
    (1..9).each { |i| assert game.move_at(i).empty? }
  end

  def test_new_game_has_no_players
    game = new_game
    assert_nil game.player_one
    assert_nil game.player_two
  end

  def test_new_game_has_no_previous_move
    assert_nil new_game.previous_move_by
  end

  def test_new_game_has_turn_count_zero
    assert_equal 0, new_game.turn_count
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::GameTestHelpers
end
