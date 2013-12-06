require_relative 'test_helper'
require 'game'

class GameTest < Minitest::Test
  def test_new_game_has_new_board
    game = new_game
    board = game.board
    assert_new_board_state(board)
  end

  def test_make_move
    game = new_game
    board = game.board
    player = blue_x
    assert_nil board[1].player
    game.make_move(position: 1, player: player)
    assert player == board[1].player
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::SharedAssertions
end