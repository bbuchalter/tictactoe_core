require_relative '../test_helper'
require 'tictactoe/game'

class GameTest < Minitest::Test
  def test_new_game_has_empty_board
    game = new_game
    assert game.move_at(1).empty?
    assert game.move_at(2).empty?
    assert game.move_at(3).empty?
    assert game.move_at(4).empty?
    assert game.move_at(5).empty?
    assert game.move_at(6).empty?
    assert game.move_at(7).empty?
    assert game.move_at(8).empty?
    assert game.move_at(9).empty?
  end

  def test_make_move
    game = new_game
    player = blue_x
    assert_nil game.move_at(1).player

    game.make_move(1, player)
    assert player == game.move_at(1).player
  end

  def test_setup_player_one
    game = new_game
    assert_equal nil, game.player_one

    game.setup_player(:human, 'X', :blue)
    game.setup_player(:computer, 'O', :green)

    assert_equal ::TicTacToe::HumanPlayer, game.player_one.class
    assert_equal 'X', game.player_one.symbol
    assert_equal :blue, game.player_one.color
  end

  def test_setup_player_two
    game = new_game
    assert_equal nil, game.player_two

    game.setup_player(:human, 'X', :blue)
    game.setup_player(:computer, 'O', :green)

    assert_equal ::TicTacToe::ComputerPlayer, game.player_two.class
    assert_equal 'O', game.player_two.symbol
    assert_equal :green, game.player_two.color
  end

  def test_game_over_with_winner
    game = new_game_with_players
    assert_equal false, game.game_over?
    assert_equal false, game.draw?
    assert_equal false, game.winner?
    make_winning_moves(game)
    assert_equal true, game.game_over?
    assert_equal true, game.winner?
    assert_equal false, game.draw?
  end

  def test_game_over_with_draw
    game = new_game_with_players
    assert_equal false, game.game_over?
    assert_equal false, game.draw?
    assert_equal false, game.winner?
    make_tie_game_moves(game)
    assert_equal true, game.game_over?
    assert_equal true, game.draw?
    assert_equal false, game.winner?
  end

  def test_turn_count
    game = new_game_with_players
    assert_equal 0, game.turn_count

    game.make_move(1, game.player_one)
    assert_equal 1, game.turn_count

    game.make_move(4, game.player_two)
    assert_equal 2, game.turn_count
  end

  def test_current_player
    game = new_game_with_players
    assert_equal game.player_one, game.current_player

    game.make_move(1, game.player_one)
    assert_equal game.player_two, game.current_player

    game.make_move(4, game.player_two)
    assert_equal game.player_one, game.current_player
  end

  private

  include ::TicTacToe::ObjectCreationMethods

  def make_winning_moves(game)
    game.make_move(1, game.player_one)
    game.make_move(4, game.player_two)
    game.make_move(2, game.player_one)
    game.make_move(5, game.player_two)
    game.make_move(3, game.player_one)
  end

  def make_tie_game_moves(game)
    game.make_move(1, game.player_one)
    game.make_move(4, game.player_two)
    game.make_move(2, game.player_one)
    game.make_move(5, game.player_two)
    game.make_move(6, game.player_one)
    game.make_move(3, game.player_two)
    game.make_move(7, game.player_one)
    game.make_move(8, game.player_two)
    game.make_move(9, game.player_one)
  end
end
