require_relative '../../test_helper'
require 'tictactoe/player/human'

class HumanPlayerTest < Minitest::Test
  def test_symbol
    assert_equal 'X', human_blue_x.symbol
  end

  def test_color
    assert_equal :blue, human_blue_x.color
  end

  def test_equality
    assert new_human_player('X', :blue) == human_blue_x
    assert nil != human_blue_x
  end

  def test_to_hash
    assert_equal({
                   symbol: 'X',
                   color: :blue
                 }, human_blue_x.to_hash)
  end

  def test_human
    assert_equal true, human_blue_x.human?
  end

  private

  include ::TicTacToe::ObjectCreationMethods
end
