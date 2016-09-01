defmodule RockPaperScissors.Player do
  @valid_moves %{"rock" => :valid, "paper" => :valid, "scissors" => :valid}

  def get_move do
    IO.gets("What's your move? (rock/paper/scissors): ")
    |> String.trim
    |> validate
  end

  defp validate(move) do
    sanitized_move = move |> String.downcase

    case @valid_moves[sanitized_move] do
      nil ->
        IO.puts("Sorry, I don't know what move you wanted to make. Try 'rock', 'paper', or 'scissors'.")
        get_move
      _   -> sanitized_move
    end
  end
end
