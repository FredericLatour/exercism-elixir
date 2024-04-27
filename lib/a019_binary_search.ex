defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    case numbers do
      {} -> :not_found
      _ -> search(numbers, key, 0, tuple_size(numbers) - 1)
    end
  end

  # @spec search(tuple(), integer(), integer(), integer()) :: {:ok, integer} | :not_found
  # defp search(numbers, key, start, finish) do
  #   mid = div(start + finish, 2)
  #   IO.inspect(%{start: start, finish: finish, mid: mid, value: elem(numbers, mid)})

  #   case {mid, elem(numbers, mid)} do
  #     {m, e} when key == e -> {:ok, m}
  #     {0, _} -> :not_found
  #     {_, _} when start == finish -> :not_found
  #     {m, e} when key > e -> search(numbers, key, m + 1, finish)
  #     {m, _} -> search(numbers, key, start, m - 1)
  #   end
  # end

  @spec search(tuple(), integer(), integer(), integer()) :: {:ok, integer} | :not_found
  defp search(_numbers, _key, start, finish) when start > finish do
    :not_found
  end

  defp search(numbers, key, start, finish) do
    mid = div(start + finish, 2)

    case elem(numbers, mid) do
      e when key == e -> {:ok, mid}
      e when key > e -> search(numbers, key, mid + 1, finish)
      _ -> search(numbers, key, start, mid - 1)
    end
  end
end
