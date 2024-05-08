defmodule Scrabble2 do
  @score %{
    1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"],
    2 => ["d", "g"],
    3 => ["b", "c", "m", "p"],
    4 => ["f", "h", "v", "w", "y"],
    5 => ["k"],
    8 => ["j", "x"],
    10 => ["q", "z"]
  }

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.downcase()
    |> String.graphemes()
    |> Enum.map(&get_score/1)
    |> Enum.sum()
  end

  defp get_score(letter) do
    Enum.find(@score, fn {_score, letters} -> letter in letters end)
    |> case do
      {score, _letters} -> score
      nil -> 0
    end
  end
end
