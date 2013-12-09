require_relative '../test_helper'
require 'tictactoe/position'

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

  private

  include ::TicTacToe::ObjectCreationMethods
end
