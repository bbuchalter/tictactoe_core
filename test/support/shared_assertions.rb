module TicTacToe
  module SharedAssertions
    def assert_new_board_state(board)
      assert_equal 9, board.length
      board.each_with_index do |position, i|
        assert_equal i+1, position.position
        assert_nil position.player
      end
    end
  end
end