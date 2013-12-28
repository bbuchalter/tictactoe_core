module TicTacToe
  module ObjectCreationMethods
    def new_human_player(symbol, color)
      ::TicTacToe::Player::Human.new(symbol, color)
    end

    def new_computer_player(symbol, color)
      ::TicTacToe::Player::Computer.new(symbol, color)
    end

    def new_position(position, player)
      ::TicTacToe::Position.new(position, player)
    end

    def new_board
      ::TicTacToe::Board.new
    end

    def new_game
      ::TicTacToe::Game.new
    end

    def new_game_with_players
      game = new_game
      game.setup_player(:human, 'X', :blue)
      game.setup_player(:human, 'O', :green)
      game
    end

    def new_game_with_computer_players
      game = new_game
      game.setup_player(:computer, 'X', :blue)
      game.setup_player(:computer, 'O', :green)
      game
    end

    def new_tuple(tuples)
      ::TicTacToe::Tuple.new(tuples)
    end

    def human_blue_x
      new_human_player('X', :blue)
    end

    def computer_green_o
      new_computer_player('O', :green)
    end

    def human_blue_x_at(position)
      new_position(position, human_blue_x)
    end

    def computer_green_o_at(position)
      new_position(position, computer_green_o)
    end

    def empty_at(position)
      new_position(position, nil)
    end

    def win_now_strategy(game, player)
      ::TicTacToe::Strategy::WinNow.new(game, player)
    end

    def block_win_strategy(game, player)
      ::TicTacToe::Strategy::BlockWin.new(game, player)
    end

    def first_move_mine_strategy(game, player)
      ::TicTacToe::Strategy::FirstMove.new(game, player)
    end
  end
end
