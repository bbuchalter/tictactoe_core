require_relative '../test_helper'
require 'tictactoe/tuple'
require 'tictactoe/position'
require 'tictactoe/player/human'
require 'tictactoe/player/computer'

class TupleTest < Minitest::Test
  def test_index
    assert_equal human_blue_x, new_tuple(alternating_positions)[0].player
    assert_equal 1, new_tuple(alternating_positions)[0].position

    assert_equal computer_green_o, new_tuple(alternating_positions)[1].player
    assert_equal 2, new_tuple(alternating_positions)[1].position
  end

  def test_each
    new_tuple(three_in_row).each_with_index do |position, index|
      assert_equal human_blue_x, position.player
      assert_equal index + 1, position.at
    end
  end

  def test_all_for_same_player
    assert_equal true, new_tuple(three_in_row).all_for_same_player?
    assert_equal false, new_tuple(alternating_positions).all_for_same_player?
    assert_equal false, new_tuple(threat).all_for_same_player?
  end

  def test_two_for_sample_player
    assert_equal false, new_tuple(no_two_in_row).two_for_same_player?
    assert_equal true, new_tuple(threat).two_for_same_player?
  end

  def test_one_empty
    assert_equal false, new_tuple([]).one_empty?
    assert_equal true, new_tuple(threat).one_empty?
  end

  def test_two_for_player?
    assert_equal false, new_tuple(threat).two_for?(computer_green_o)
    assert_equal true, new_tuple(threat).two_for?(human_blue_x)
  end

  private

  include ::TicTacToe::ObjectCreationMethods

  def alternating_positions
    [
        human_blue_x_at(1),
        computer_green_o_at(2),
        human_blue_x_at(3)
    ]
  end

  def three_in_row
    [
        human_blue_x_at(1),
        human_blue_x_at(2),
        human_blue_x_at(3)
    ]
  end

  def threat
    [
        human_blue_x_at(1),
        empty_at(2),
        human_blue_x_at(3)
    ]
  end

  def no_two_in_row
    [
        human_blue_x_at(1),
        computer_green_o_at(2)
    ]
  end
end
