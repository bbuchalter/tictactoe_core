require_relative '../../test_helper'
require 'tictactoe/game'

class GameBoardTest < Minitest::Test
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

  def test_corners
    game = new_game
    corners = game.corners
    assert_equal 4, corners.length
    assert_equal 1, corners[0].position
    assert_equal 3, corners[1].position
    assert_equal 7, corners[2].position
    assert_equal 9, corners[3].position
  end

  def test_sides
    game = new_game
    sides = game.sides
    assert_equal 4, sides.length
    assert_equal 2, sides[0].position
    assert_equal 4, sides[1].position
    assert_equal 6, sides[2].position
    assert_equal 8, sides[3].position
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::GameTestHelpers
end
