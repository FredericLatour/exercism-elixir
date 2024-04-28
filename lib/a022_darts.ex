defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    case :math.sqrt(x * x + y * y) do
      d when d <= 1.0 -> 10
      d when d <= 5.0 -> 5
      d when d <= 10.0 -> 1
      _ -> 0
    end
  end
end
