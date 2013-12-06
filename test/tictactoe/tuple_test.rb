require_relative '../test_helper'
require 'tictactoe/tuple'
require 'tictactoe/position'

class TupleTest < Minitest::Test
  def test_index
    assert_equal blue_x, new_tuple(positions)[0].player
    assert_equal 1, new_tuple(positions)[0].position

    assert_equal green_o, new_tuple(positions)[1].player
    assert_equal 2, new_tuple(positions)[1].position
  end

  def test_all_for_same_player
    assert_equal true, new_tuple(three_in_row).all_for_same_player?
    assert_equal false, new_tuple(positions).all_for_same_player?
    assert_equal false, new_tuple(two_in_row_with_nil).all_for_same_player?
  end

  private

  include ::TicTacToe::ObjectCreationMethods

  def positions
    [
        blue_x_at(1),
        green_o_at(2),
        blue_x_at(3)
    ]
  end

  def three_in_row
    [
        blue_x_at(1),
        blue_x_at(2),
        blue_x_at(3)
    ]
  end

  def two_in_row_with_nil
    [
        blue_x_at(1),
        empty_at(2),
        blue_x_at(3)
    ]
  end
end
