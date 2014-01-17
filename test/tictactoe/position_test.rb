require_relative '../test_helper'
require 'tictactoe/position'
require 'tictactoe/player/human'

class PositionTest < Minitest::Test
  def test_at
    assert_equal 1, human_blue_x_at(1).position
  end

  def test_by
    assert_equal human_blue_x, human_blue_x_at(1).player
  end

  def test_empty
    assert empty_at(1).empty?
    assert_equal false, human_blue_x_at(1).empty?
  end

  def test_corner?
    assert_equal true, human_blue_x_at(1).corner?
    assert_equal true, human_blue_x_at(3).corner?
    assert_equal true, human_blue_x_at(7).corner?
    assert_equal true, human_blue_x_at(9).corner?

    assert_equal false, human_blue_x_at(2).corner?
    assert_equal false, human_blue_x_at(4).corner?
    assert_equal false, human_blue_x_at(5).corner?
    assert_equal false, human_blue_x_at(6).corner?
    assert_equal false, human_blue_x_at(8).corner?
  end

  def test_empty_position_initializer
    assert ::TicTacToe::Position.empty(1).empty?
  end

  private

  include ::TicTacToe::ObjectCreationMethods
end
