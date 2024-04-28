defmodule ResistorColorTrio2 do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) do
    color_values = %{
      black: 0,
      brown: 1,
      red: 2,
      orange: 3,
      yellow: 4,
      green: 5,
      blue: 6,
      violet: 7,
      grey: 8,
      white: 9
    }

    values = Enum.map(colors, &Map.get(color_values, &1))

    number =
      ((Enum.at(values, 0) * 10 + Enum.at(values, 1)) * :math.pow(10, Enum.at(values, 2)))
      |> round()

    simplify(number, [:ohms, :kiloohms, :megaohms, :gigaohms])
  end

  defp simplify(0, [unit | _]), do: {0, unit}

  defp simplify(number, [_ | units]) when rem(number, 1_000) == 0 do
    simplify(div(number, 1_000), units)
  end

  defp simplify(number, [unit | _]) do
    {number, unit}
  end
end
