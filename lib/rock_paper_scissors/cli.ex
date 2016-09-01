defmodule RockPaperScissors.CLI do
  alias RockPaperScissors.Player
  alias RockPaperScissors.Computer
  alias RockPaperScissors.Game
  alias RockPaperScissors.Judge

  def main(_args) do
    start(%Game{})
  end

  defp start(game) do
    welcome
    play(game)
  end

  defp welcome do
    IO.puts "Welcome to Rock, Paper, Scissors! Have fun."
  end

  defp play(game) do
    {Player.get_move, Computer.make_move(game)}
    |> Judge.evaluate(game)
    |> display_result
    |> play_again?
  end

  defp display_result(game = %Game{wins: wins, losses: losses, ties: ties, last_result: last_result, last_player_move: player_move, last_computer_move: computer_move}) do
    IO.puts "You played: #{String.capitalize(player_move)}, Computer played: #{String.capitalize(computer_move)}"
    case last_result do
      :player_win  -> IO.puts "You Won!"
      :player_loss -> IO.puts "You Lost!"
      :tie         -> IO.puts "Tie!"
    end

    IO.puts "Your record: Wins - #{wins}, Losses - #{losses}, Ties - #{ties}"

    game
  end

  defp play_again?(game = %Game{wins: wins, losses: losses, ties: ties}) do
    play_again = (IO.gets "Want to play again? (y/n) ") |> String.trim |> String.downcase

    case Enum.member?(["y", "n"], play_again) do
      true  ->
        if play_again == "y" do
          play(game)
        else
          IO.puts "Ciao!"
        end
      false ->
        IO.puts "Sorry, I don't know what that means."
        play_again?(game)
    end
  end
end
