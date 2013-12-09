require_relative '../../test_helper'
require 'tictactoe/player/computer'
require 'tictactoe/game'
require 'tictactoe/strategy/win_or_block'

class ComputerPlayerTest < Minitest::Test
  def test_select_position_using_win_or_block
    game = new_game_with_players
    position_player_one_for_win(game)
    assert_equal 3, computer_green_o.select_position(game)
  end

  def test_select_position_when_cannot_select_position
    game = new_game_with_players
    make_tie_game_moves(game)
    assert_raises(::TicTacToe::ComputerPlayer::CannotSelectPosition) do
      computer_green_o.select_position(game)
    end
  end

  def test_human
    assert_equal false, computer_green_o.human?
  end

  private

  include ::TicTacToe::ObjectCreationMethods
  include ::TicTacToe::GameTestHelpers
end
