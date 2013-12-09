require_relative '../../test_helper'
require 'tictactoe/strategy/tactics'

class StrategyTacticsTest < Minitest::Test
  include ::TicTacToe::Strategy::Tactics

  def test_take_center
    assert_equal 5, take_center
  end

  def test_take_corner
    assert_equal 1, take_corner
  end
end
