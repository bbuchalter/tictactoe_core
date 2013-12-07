module TicTacToe
  module ObjectCreationMethods
    def new_player(symbol, color)
      ::TicTacToe::Player.new(symbol, color)
    end

    def new_human_player
      ::TicTacToe::HumanPlayer.new('X', :blue)
    end

    def new_computer_player
      ::TicTacToe::ComputerPlayer.new('O', :green)
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

    def new_tuple(tuples)
      ::TicTacToe::Tuple.new(tuples)
    end

    def blue_x
      new_player('X', :blue)
    end

    def green_o
      new_player('O', :green)
    end

    def blue_x_at(position)
      new_position(position, blue_x)
    end

    def green_o_at(position)
      new_position(position, green_o)
    end

    def empty_at(position)
      new_position(position, nil)
    end
  end
end
