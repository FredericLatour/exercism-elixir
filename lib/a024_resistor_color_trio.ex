defmodule ResistorColorTrio do
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

    cond do
      number == 0 -> {0, :ohms}
      rem(number, 1_000_000_000) == 0 -> {div(number, 1_000_000_000), :gigaohms}
      rem(number, 1_000_000) == 0 -> {div(number, 1_000_000), :megaohms}
      rem(number, 1_000) == 0 -> {div(number, 1_000), :kiloohms}
      true -> {number, :ohms}
    end
  end
end
