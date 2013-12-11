require_relative '../../test_helper'
require 'tictactoe/player/computer'
require 'tictactoe/game'
require 'tictactoe/strategy'

class ComputerPlayerTest < Minitest::Test
  def test_select_position_when_able_to_win
    game = new_game_with_computer_players
    position_player_one_for_win(game)
    assert_equal 3, game.player_one.select_position(game)
  end

  def test_select_position_when_able_to_block_win
    game = new_game_with_computer_players
    position_player_two_for_blocking_win(game)
    assert_equal 3, game.player_two.select_position(game)
  end

  def test_select_position_when_cannot_select_position
    game = new_game_with_computer_players
    make_tie_game_moves(game)
    assert_raises(::TicTacToe::ComputerPlayer::CannotSelectPosition) do
      game.player_one.select_position(game)
    end
  end

  def test_select_position_using_first_move_mine
    game = new_game_with_computer_players
    assert_equal 1, game.player_one.select_position(game)
  end

  def test_select_position_using_second_move_mine_first_move_not_center
    game = new_game_with_computer_players
    game.make_move(1, game.player_one)
    assert_equal 5, game.player_two.select_position(game)
  end

  def test_select_position_using_second_move_mine_first_move_center
    game = new_game_with_computer_players
    game.make_move(5, game.player_one)
    assert_equal 1, game.player_two.select_position(game)
  end

  def test_select_position_when_able_to_fork
    game = new_game_with_computer_players
    position_player_one_to_fork(game)
    assert_equal 3, game.player_one.select_position(game)
  end

  def test_select_position_when_able_to_block_fork
    game = new_game_with_computer_players
    position_player_two_to_block_fork(game)
    assert_equal 2, game.player_two.select_position(game)
  end

  def test_select_position_when_able_to_take_opposite_corner
    game = new_game_with_computer_players
    position_player_two_for_opposite_corner(game)
    assert_equal 3, game.player_two.select_position(game)
  end

  def test_select_position_when_must_take_corner
    game = new_game_with_computer_players
    position_player_one_to_take_last_corner(game)
    assert_equal 9, game.player_one.select_position(game)
  end

  def test_select_position_when_must_take_side
    game = new_game_with_computer_players
    position_player_one_to_take_last_side(game)
    assert_equal 6, game.player_one.select_position(game)
  end

  def test_human
    assert_equal false, computer_green_o.human?
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::GameTestHelpers
end
