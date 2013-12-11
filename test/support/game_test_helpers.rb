module TicTacToe
  module GameTestHelpers
    def make_winning_moves(game)
      one_move_away_from_win(game)
      game.make_move(3, game.player_one)
    end

    def one_move_away_from_win(game)
      game.make_move(1, game.player_one)
      game.make_move(4, game.player_two)
      game.make_move(2, game.player_one)
      game.make_move(9, game.player_two)
    end

    def make_draw(game)
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

    def empty_board_state
      {
          '1' => {}, '2' => {}, '3' => {},
          '4' => {}, '5' => {}, '6' => {},
          '7' => {}, '8' => {}, '9' => {}
      }
    end

    def position_player_one_for_win(game)
      game.make_move(1, game.player_one)
      game.make_move(4, game.player_two)
      game.make_move(2, game.player_one)
      game.make_move(5, game.player_two)
    end

    def position_player_two_for_blocking_win(game)
      game.make_move(1, game.player_one)
      game.make_move(4, game.player_two)
      game.make_move(2, game.player_one)
    end

    def position_player_one_to_fork(game)
      game.make_move(1, game.player_one)
      game.make_move(5, game.player_two)
      game.make_move(9, game.player_one)
      game.make_move(7, game.player_two)
    end

    def position_player_two_to_block_fork(game)
      game.make_move(1, game.player_one)
      game.make_move(5, game.player_two)
      game.make_move(9, game.player_one)
    end

    def position_player_two_to_block_fork_without_center(game)
      game.make_move(5, game.player_one)
      game.make_move(1, game.player_two)
      game.make_move(9, game.player_one)
    end

    def position_player_two_for_opposite_corner(game)
      game.make_move(2, game.player_one)
      game.make_move(4, game.player_two)
      game.make_move(6, game.player_one)
      game.make_move(8, game.player_two)
      game.make_move(7, game.player_one)
    end

    def position_player_one_to_take_last_corner(game)
      game.make_move(1, game.player_one)
      game.make_move(4, game.player_two)
      game.make_move(2, game.player_one)
      game.make_move(5, game.player_two)
      game.make_move(6, game.player_one)
      game.make_move(3, game.player_two)
      game.make_move(7, game.player_one)
      game.make_move(8, game.player_two)
    end

    def position_player_one_to_take_last_side(game)
      game.make_move(1, game.player_one)
      game.make_move(2, game.player_two)
      game.make_move(3, game.player_one)
      game.make_move(4, game.player_two)
      game.make_move(5, game.player_one)
      game.make_move(9, game.player_two)
      game.make_move(8, game.player_one)
      game.make_move(7, game.player_two)
    end

    def take_all_corners(game)
      game.make_move(1, game.player_one)
      game.make_move(3, game.player_two)
      game.make_move(7, game.player_one)
      game.make_move(9, game.player_two)
    end

    def take_all_sides(game)
      game.make_move(2, game.player_one)
      game.make_move(4, game.player_two)
      game.make_move(6, game.player_one)
      game.make_move(8, game.player_two)
    end

    def make_moves_to_win_on_last_move(game)
      game.make_move(9, game.player_one)
      game.make_move(5, game.player_two)
      game.make_move(7, game.player_one)
      game.make_move(8, game.player_two)
      game.make_move(2, game.player_one)
      game.make_move(4, game.player_two)
      game.make_move(3, game.player_one)
      game.make_move(1, game.player_two)
      game.make_move(6, game.player_one)
    end
  end
end
