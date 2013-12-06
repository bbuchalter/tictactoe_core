require_relative 'test_helper'
require 'player'

class PlayerTest < Minitest::Test
  def test_symbol
    assert_equal 'X', blue_x.symbol
  end

  def test_color
    assert_equal :blue, blue_x.color
  end

  def test_equality
    assert blue_x == blue_x
    assert nil != blue_x
    assert blue_x != nil
  end

  private

  include ::TicTacToe::ObjectCreationMethods
end