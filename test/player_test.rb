require_relative 'test_helper'
require 'player'

class PlayerTest < Minitest::Test
  def test_symbol
    assert_equal "X", blue_x.symbol
  end

  def test_color
    assert_equal :blue, blue_x.color
  end

  def test_equality
    assert_equal blue_x, blue_x
  end

  private

  include ::TicTacToe::ObjectCreationMethods
end