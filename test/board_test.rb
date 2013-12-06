require_relative 'test_helper'
require 'board'

class BoardTest < Minitest::Test
  def test_new_board_has_no_players
    board = new_board
    assert_new_board_state(board)
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::SharedAssertions
end