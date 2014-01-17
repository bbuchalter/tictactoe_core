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
    assert_nil new_game.previous_move_player
  end

  def test_new_game_has_turn_count_zero
    assert_equal 0, new_game.turn_count
  end

  def test_deep_clone
    game = new_game_with_players
    make_draw(game)
    clone = game.deep_clone

    assert_equal game.player_one,             clone.player_one
    assert_equal game.player_two,             clone.player_two
    assert_equal game.board_state,            clone.board_state
    assert_equal game.turn_count,             clone.turn_count
    assert_equal game.previous_move_player,   clone.previous_move_player
    assert_equal game.previous_move_position, clone.previous_move_position
  end

  def test_possible_games_in_draw
    assert_equal [], draw_game.possible_games
  end

  def test_possible_games_with_one_move_remaining
    possible_games = one_possible_move_left_game.possible_games
    assert_equal 1, possible_games.count
    assert possible_games.first.game_over?
  end

  def test_possible_games_with_two_moves_remaining
    possible_games = two_possible_moves_left_game.possible_games
    assert_equal 2, possible_games.count
    moves_made = possible_games.map(&:previous_move_position)
    assert_equal [1, 6], moves_made
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::GameTestHelpers
end
