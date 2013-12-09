require_relative '../../test_helper'
require 'tictactoe/game'

class GameQueryStateTest < Minitest::Test
  def test_turn_count
    game = new_game_with_players
    assert_equal 0, game.turn_count

    game.make_move(1, game.player_one)
    assert_equal 1, game.turn_count

    game.make_move(4, game.player_two)
    assert_equal 2, game.turn_count
  end

  def test_move_at
    game = new_game
    assert game.move_at(1).respond_to?(:position)
    assert game.move_at(1).respond_to?(:at)
    assert game.move_at(1).respond_to?(:player)
  end

  def test_board_state
    game = new_game_with_players
    assert_equal(empty_board_state, game.board_state)

    game.make_move(1, game.player_one)
    new_state = empty_board_state.merge('1' => { symbol: 'X', color: :blue })
    assert_equal(new_state, game.board_state)
  end

  def test_previous_move_player
    game = new_game_with_players
    assert_equal nil, game.previous_move_player

    game.make_move(1, game.player_one)
    assert_equal game.player_one, game.previous_move_player

    game.make_move(4, game.player_two)
    assert_equal game.player_two, game.previous_move_player
  end

  def test_current_player
    game = new_game_with_players
    assert_equal game.player_one, game.current_player

    game.make_move(1, game.player_one)
    assert_equal game.player_two, game.current_player

    game.make_move(4, game.player_two)
    assert_equal game.player_one, game.current_player
  end

  def test_previous_move_position
    game = new_game_with_players
    assert_equal nil, game.previous_move_position

    game.make_move(1, game.player_one)
    assert_equal 1, game.previous_move_position

    game.make_move(4, game.player_two)
    assert_equal 4, game.previous_move_position
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::GameTestHelpers
end
