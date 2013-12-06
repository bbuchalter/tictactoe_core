require_relative 'test_helper'
require 'board'

class BoardTest < Minitest::Test
  def test_initial_state_has_no_players
    board = new_board
    assert_equal 9, board.length
    board.each_with_index do |position, i|
      assert_equal i+1, position.position
      assert_nil position.player
    end
  end

  private

  include ::TicTacToe::ObjectCreationMethods
end