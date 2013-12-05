require_relative 'test_helper'
require 'position'

class PositionTest < Minitest::Test
  def test_at
    assert_equal 1, position_one_is_x.position
  end

  def test_by
    assert_equal blue_x, position_one_is_x.player
  end

  private

  include ::TicTacToe::ObjectCreationMethods
end