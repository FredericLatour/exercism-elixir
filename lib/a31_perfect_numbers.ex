defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) do
    aliquot_sum = get_factors(number, number - 1, []) |> Enum.sum()

    cond do
      number <= 0 -> {:error, "Classification is only possible for natural numbers."}
      aliquot_sum == number -> {:ok, :perfect}
      aliquot_sum > number -> {:ok, :abundant}
      aliquot_sum < number -> {:ok, :deficient}
    end
  end

  defp get_factors(number, i, lst) do
    case i do
      n when n <= 0 -> []
      1 -> [1 | lst]
      n when rem(number, i) == 0 -> get_factors(number, n - 1, [n | lst])
      n -> get_factors(number, n - 1, lst)
    end
  end
end
