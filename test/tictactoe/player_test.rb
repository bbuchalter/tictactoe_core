require_relative '../test_helper'
require 'tictactoe/player'

class PlayerTest < Minitest::Test
  def test_symbol
    assert_equal 'X', blue_x.symbol
  end

  def test_color
    assert_equal :blue, blue_x.color
  end

  def test_equality
    assert new_player('X', :blue) == blue_x
    assert nil != blue_x
  end

  def test_class_for
    assert_equal ::TicTacToe::HumanPlayer,
                 ::TicTacToe::Player.class_for(:human)

    assert_equal ::TicTacToe::ComputerPlayer,
                 ::TicTacToe::Player.class_for(:computer)
  end

  private

  include ::TicTacToe::ObjectCreationMethods
end
