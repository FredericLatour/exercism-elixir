defmodule Username do
  def sanitize(username) do
    replacement = %{
      ?ä => ~c"ae",
      ?ö => ~c"oe",
      ?ü => ~c"ue",
      ?ß => ~c"ss"
    }

    case username do
      [] ->
        []

      [head | tail] when (head >= ?a and head <= ?z) or head == ?_ ->
        [head | sanitize(tail)]

      [head | tail] ->
        case replacement[head] do
          nil -> sanitize(tail)
          res -> res ++ sanitize(tail)
        end
    end
  end
end
