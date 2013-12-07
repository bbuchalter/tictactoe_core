module TicTacToe
  module GameTestHelpers
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

    def empty_board_state
      {
          '1' => {}, '2' => {}, '3' => {},
          '4' => {}, '5' => {}, '6' => {},
          '7' => {}, '8' => {}, '9' => {}
      }
    end
  end
end