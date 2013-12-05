require 'minitest/autorun'
require_relative 'support/setup_load_paths'
require 'player'

class PlayerTest < Minitest::Test
  def test_symbol
    assert_equal "X", blue_x.symbol
  end

  def test_color
    assert_equal :blue, blue_x.color
  end

  private

  def blue_x
    new_player("X", :blue)
  end

  def new_player(symbol, color)
    TicTacToe::Player.new(symbol: symbol, color: color)
  end
end