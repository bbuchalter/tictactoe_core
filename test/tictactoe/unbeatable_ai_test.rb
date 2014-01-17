require_relative '../test_helper'
require 'tictactoe/game'

class UnbeatableAITest < Minitest::Test
  #def test_computer_is_unbeatable_as_player_one
  #  game = new_game
  #  game.setup_player(:computer, 'X', :blue)
  #  game.setup_player(:human, 'O', :green)
  #  first_move = game.player_one.select_position(game)
  #  all_games = all_games_as_player_one(game, first_move)
  #  outcome_map = map_outcomes(all_games)
  #
  #  print_outcome_as_player_one(outcome_map)
  #  assert outcome_map[:player_two_wins].empty?
  #end
  #
  #def test_computer_is_unbeatable_as_player_two
  #  game = new_game
  #  game.setup_player(:human, 'X', :green)
  #  game.setup_player(:computer, 'O', :blue)
  #  all_games = all_games_as_player_two(game)
  #  outcome_map = map_outcomes(all_games)
  #
  #  print_outcome_as_player_two(outcome_map)
  #  assert outcome_map[:player_one_wins].empty?
  #end

  private

  include ::TicTacToe::ObjectCreationMethods

  def all_games_as_player_one(game, first_move)
    all_games(game, first_move).flatten
  end

  def all_games_as_player_two(game)
    game.empty_positions.map do |possible_move|
      all_games(game.deep_clone, possible_move)
    end.flatten
  end

  def all_games(game, new_move)
    all_games = []
    game.make_move(new_move, game.current_player)

    return all_games << game if game.game_over?

    if game.current_player.human?
      all_games << all_games_for_human_move(game)
    else
      all_games << all_games_for_computer_move(game)
    end

    all_games
  end

  def all_games_for_human_move(game)
    game.empty_positions.map do |possible_move|
      all_games(game.deep_clone, possible_move)
    end
  end

  def all_games_for_computer_move(game)
    computer_move = game.current_player.select_position(game)
    all_games(game.deep_clone, computer_move)
  end

  def map_outcomes(games)
    games.reduce(empty_outcome_set) do |outcomes, game|
      if game.winner == game.player_one
        outcomes[:player_one_wins] << game
      elsif game.winner == game.player_two
        outcomes[:player_two_wins] << game
      else
        outcomes[:draws] << game
      end
      outcomes
    end
  end

  def empty_outcome_set
    {
        player_one_wins: [],
        player_two_wins: [],
        draws: []
    }
  end

  def print_outcome_as_player_one(outcome_map)
    puts %Q{
Games with computer as player one:
won #{outcome_map[:player_one_wins].length},
draw: #{outcome_map[:draws].length},
lost: #{outcome_map[:player_two_wins].length}
         }
  end

  def print_outcome_as_player_two(outcome_map)
    puts %Q{
Games with computer as player two:
won #{outcome_map[:player_two_wins].length},
draw: #{outcome_map[:draws].length},
lost: #{outcome_map[:player_one_wins].length}
         }
  end
end
