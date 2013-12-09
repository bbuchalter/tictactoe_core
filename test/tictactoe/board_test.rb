require_relative '../test_helper'
require 'tictactoe/board'

class BoardTest < Minitest::Test
  def test_new_board_is_empty
    board = new_board
    assert_board_empty(board)
  end

  def test_position_index
    board = new_board
    assert_equal 1, board.at(1).position
    assert_equal 9, board.at(9).position
  end

  def test_new_move_for
    board = new_board
    assert board.at(1).empty?
    board.new_move_for(1, 'X')
    assert !board.at(1).empty?
  end

  def test_duplicate_moves
    board = new_board
    board.new_move_for(1, 'X')
    assert_raises(::TicTacToe::Board::PositionTaken) do
      board.new_move_for(1, 'X')
    end
  end

  def test_invalid_moves
    board = new_board
    assert_raises(::TicTacToe::Board::InvalidPosition) do
      board.new_move_for(10, 'X')
    end
  end

  def test_board_has_all_tuples
    board = new_board
    assert_board_has_all_tuples(board)
  end

  def test_corners
    board = new_board
    corners = board.corners
    assert_equal 4, corners.length
    assert_equal 1, corners[0].position
    assert_equal 3, corners[1].position
    assert_equal 7, corners[2].position
    assert_equal 9, corners[3].position
  end

  private

  include ::TicTacToe::ObjectCreationMethods

  def assert_board_empty(board)
    assert_equal 9, board.length
    board.each_with_index do |position, i|
      assert_equal i + 1, position.at
      assert_nil position.player
    end
  end

  def assert_board_has_all_tuples(board)
    assert_board_has_all_row_tuples(board)
    assert_board_has_all_column_tuples(board)
    assert_board_has_all_diagonal_tuples(board)
    assert_equal 8, board.tuples.length
  end

  def assert_board_has_all_diagonal_tuples(board)
    assert_equal board.at(1), board.tuples[6][0]
    assert_equal board.at(5), board.tuples[6][1]
    assert_equal board.at(9), board.tuples[6][2]

    assert_equal board.at(3), board.tuples[7][0]
    assert_equal board.at(5), board.tuples[7][1]
    assert_equal board.at(7), board.tuples[7][2]
  end

  def assert_board_has_all_column_tuples(board)
    assert_equal board.at(1), board.tuples[3][0]
    assert_equal board.at(4), board.tuples[3][1]
    assert_equal board.at(7), board.tuples[3][2]

    assert_equal board.at(2), board.tuples[4][0]
    assert_equal board.at(5), board.tuples[4][1]
    assert_equal board.at(8), board.tuples[4][2]

    assert_equal board.at(3), board.tuples[5][0]
    assert_equal board.at(6), board.tuples[5][1]
    assert_equal board.at(9), board.tuples[5][2]
  end

  def assert_board_has_all_row_tuples(board)
    assert_equal board.at(1), board.tuples[0][0]
    assert_equal board.at(2), board.tuples[0][1]
    assert_equal board.at(3), board.tuples[0][2]

    assert_equal board.at(4), board.tuples[1][0]
    assert_equal board.at(5), board.tuples[1][1]
    assert_equal board.at(6), board.tuples[1][2]

    assert_equal board.at(7), board.tuples[2][0]
    assert_equal board.at(8), board.tuples[2][1]
    assert_equal board.at(9), board.tuples[2][2]
  end
end
