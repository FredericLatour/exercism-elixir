defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1, 2, 3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    case list do
      [] ->
        []

      [head | tail] ->
        case head do
          nil -> flatten(tail)
          [] -> flatten(tail)
          [_h | _t] -> flatten(head) ++ flatten(tail)
          _ -> [head | flatten(tail)]
        end
    end
  end
end
