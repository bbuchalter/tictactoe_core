require_relative 'test_helper'
require 'game'

class GameTest < Minitest::Test
  def test_new_game_has_new_board
    game = new_game
    board = game.board
    assert_new_board_state(board)
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::SharedAssertions
end