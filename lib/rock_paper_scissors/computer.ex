defmodule RockPaperScissors.Computer do
  alias RockPaperScissors.Game

  @valid_moves ["rock", "paper", "scissors"]
  @move_mappings %{
    player_win: %{
      "rock" => "paper",
      "paper" => "scissors",
      "scissors" => "rock"
    }, player_loss: %{
      "rock" => "rock",
      "paper" => "paper",
      "scissors" => "scissors"
    }
  }

  def make_move(%Game{last_player_move: nil}) do
    generate_random_move
  end

  def make_move(%Game{last_result: :tie}) do
    generate_random_move
  end

  def make_move(%Game{last_result: last_result, last_player_move: last_player_move}) do
    @move_mappings[last_result][last_player_move]
  end

  defp generate_random_move do
    Enum.random(@valid_moves)
  end
end
