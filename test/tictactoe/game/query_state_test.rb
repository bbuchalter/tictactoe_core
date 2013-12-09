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

  def test_empty_positions
    game = new_game_with_players
    assert_equal 1, game.empty_positions[0]
    assert_equal 9, game.empty_positions.length

    game.make_move(1, game.player_one)
    assert_equal 2, game.empty_positions[0]
    assert_equal 8, game.empty_positions.length

    game = new_game_with_players
    make_tie_game_moves(game)
    assert_equal 0, game.empty_positions.length
  end

  def test_two_threats_by?
    game = new_game_with_players
    assert_equal false, game.two_threats_by?(game.player_one)

    game.make_move(1, game.player_one)
    game.make_move(5, game.player_two)
    game.make_move(9, game.player_one)
    assert_equal false, game.two_threats_by?(game.player_one)

    game.make_move(7, game.player_two)
    game.make_move(3, game.player_one)
    assert_equal true, game.two_threats_by?(game.player_one)
  end

  def test_previous_move_in_corner?
    game = new_game_with_players
    assert_equal false, game.previous_move_in_corner?
    game.make_move(1, game.player_one)
    assert_equal true, game.previous_move_in_corner?
    game.make_move(2, game.player_one)
    assert_equal false, game.previous_move_in_corner?
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
