defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    cond do
      size < 1 or size > String.length(s) -> []
      true -> get_slices(s, size, String.length(s) - size + 1, 0, [])
    end
  end

  defp get_slices(s, size, count, i, lst) do
    case i do
      n when n == count -> lst |> Enum.reverse()
      _ -> get_slices(s, size, count, i + 1, [String.slice(s, i..(i + size - 1)) | lst])
    end
  end
end
