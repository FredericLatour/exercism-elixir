defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base_sorted = sort_str(base)

    candidates
    |> Enum.filter(fn c ->
      String.downcase(c) != String.downcase(base) and sort_str(c) == base_sorted
    end)
  end

  defp sort_str(s) do
    s
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
  end
end
