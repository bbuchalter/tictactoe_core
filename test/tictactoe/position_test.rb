require_relative '../test_helper'
require 'tictactoe/position'

class PositionTest < Minitest::Test
  def test_at
    assert_equal 1, blue_x_at(1).position
  end

  def test_by
    assert_equal blue_x, blue_x_at(1).player
  end

  def test_empty
    assert empty_at(1).empty?
    assert_equal false, blue_x_at(1).empty?
  end

  private

  include ::TicTacToe::ObjectCreationMethods
end
