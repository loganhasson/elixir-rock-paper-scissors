defmodule RockPaperScissors.Judge do
  alias RockPaperScissors.Game

  def evaluate({player_move, computer_move}, game) when player_move == computer_move do
    update_game(game, :tie, player_move, computer_move)
  end

  def evaluate({player_move = "rock", computer_move = "scissors"}, game) do
    update_game(game, :player_win, player_move, computer_move)
  end

  def evaluate({player_move = "paper", computer_move = "rock"}, game) do
    update_game(game, :player_win, player_move, computer_move)
  end

  def evaluate({player_move = "scissors", computer_move = "paper"}, game) do
    update_game(game, :player_win, player_move, computer_move)
  end

  def evaluate({player_move, computer_move}, game) do
    update_game(game, :player_loss, player_move, computer_move)
  end

  defp update_game(game, result, player_move, computer_move) do
    case result do
      :player_win ->
        wins = game.wins
        %Game{game | wins: wins + 1, last_player_move: player_move, last_computer_move: computer_move, last_result: result}
      :player_loss ->
        losses = game.losses
        %Game{game | losses: losses + 1, last_player_move: player_move, last_computer_move: computer_move, last_result: result}
      :tie ->
        ties = game.ties
        %Game{game | ties: ties + 1, last_player_move: player_move, last_computer_move: computer_move, last_result: result}
    end
  end
end
