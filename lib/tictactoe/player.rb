module TicTacToe
  class Player
    attr_reader :symbol, :color

    def initialize(symbol, color)
      @symbol = symbol
      @color = color
    end

    def ==(other)
      instance_variables.all? do |attr|
        instance_variable_get(attr) == other.instance_variable_get(attr)
      end
    end

    def self.class_for(type)
      case type
        when :human
          ::TicTacToe::HumanPlayer
        when :computer
          ::TicTacToe::ComputerPlayer
      end
    end
  end

  class HumanPlayer < Player; end
  class ComputerPlayer < Player; end
end
