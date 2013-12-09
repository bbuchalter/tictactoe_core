require_relative '../../test_helper'
require 'tictactoe/game'

class GameChangeStateTest < Minitest::Test
  def test_make_move
    game = new_game
    player = human_blue_x
    assert_equal nil, game.move_at(1).player

    game.make_move(1, player)
    assert player == game.move_at(1).player
  end

  def test_duplicate_moves
    game = new_game_with_players
    game.make_move(1, game.player_one)
    assert_raises(::TicTacToe::Board::PositionTaken) do
      game.make_move(1, game.player_one)
    end
  end

  def test_invalid_move
    game = new_game_with_players
    assert_raises(::TicTacToe::Board::InvalidPosition) do
      game.make_move(10, game.player_one)
    end
  end

  def test_reset_board_emptied
    game = new_game_with_players
    game.make_move(1, game.player_one)
    assert !game.move_at(1).empty?

    game.reset
    assert game.move_at(1).empty?
  end

  def test_reset_turn_count
    game = new_game_with_players
    game.make_move(1, game.player_one)
    assert_equal 1, game.turn_count

    game.reset
    assert_equal 0, game.turn_count
  end

  def test_reset_previous_move_by
    game = new_game_with_players
    game.make_move(1, game.player_one)
    assert_equal game.player_one, game.previous_move_by

    game.reset
    assert_equal nil, game.previous_move_by
  end

  def test_reset_current_player
    game = new_game_with_players
    game.make_move(1, game.player_one)
    assert_equal game.player_two, game.current_player

    game.reset
    assert_equal game.player_one, game.current_player
  end

  private

  include ::TicTacToe::ObjectCreationMethods
end
