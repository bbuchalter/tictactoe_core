require_relative '../test_helper'
require 'tictactoe/board'

class BoardTest < Minitest::Test
  def test_new_board_has_no_players
    board = new_board
    assert_new_board_state(board)
  end

  def test_position_index
    board = new_board
    assert_equal 1, board[1].position
    assert_equal 9, board[9].position
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::SharedAssertions
end