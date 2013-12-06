module TicTacToe
  module ObjectCreationMethods
    def new_player(symbol, color)
      ::TicTacToe::Player.new(symbol: symbol, color: color)
    end

    def new_position(position, player)
      ::TicTacToe::Position.new(position: position, player: player)
    end

    def new_board
      ::TicTacToe::Board.new
    end

    def new_game
      ::TicTacToe::Game.new
    end

    def blue_x
      new_player('X', :blue)
    end

    def position_one_is_x
      new_position(1, blue_x)
    end
  end
end