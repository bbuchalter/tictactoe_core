require_relative '../test_helper'
require 'tictactoe/game'

class GameTest < Minitest::Test
  def test_new_game_has_new_board
    game = new_game
    board = game.board
    assert_new_board_state(board)
  end

  def test_make_move
    game = new_game
    board = game.board
    player = blue_x
    assert_nil board[1].player
    game.make_move(1, player)
    assert player == board[1].player
  end

  def test_setup_player
    game = new_game
    assert_equal nil, game.player_one
    assert_equal nil, game.player_two

    game.setup_player(:human, "X", :blue)
    game.setup_player(:computer, "O", :green)

    assert_equal ::TicTacToe::HumanPlayer, game.player_one.class
    assert_equal "X", game.player_one.symbol
    assert_equal :blue, game.player_one.color

    assert_equal ::TicTacToe::ComputerPlayer, game.player_two.class
    assert_equal "O", game.player_two.symbol
    assert_equal :green, game.player_two.color
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::SharedAssertions
end