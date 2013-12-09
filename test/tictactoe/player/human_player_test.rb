require_relative '../../test_helper'
require 'tictactoe/player/human'

class HumanPlayerTest < Minitest::Test
  def test_human
    assert_equal true, human_blue_x.human?
  end

  include ::TicTacToe::ObjectCreationMethods
end
