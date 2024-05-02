defmodule BoutiqueInventory do
  @type size_quantity :: %{
          s: non_neg_integer(),
          m: non_neg_integer(),
          l: non_neg_integer(),
          xl: non_neg_integer()
        }

  @type item :: %{
          price: non_neg_integer(),
          name: String.t(),
          quantity_by_size: size_quantity()
        }

  @type inventory :: [item()]

  def sort_by_price(inventory) do
    Enum.sort_by(inventory, & &1.price)
  end

  @spec with_missing_price(inventory()) :: list(item())
  def with_missing_price(inventory) do
    Enum.filter(inventory, fn x -> x.price == nil end)
  end

  @spec update_names(inventory(), String.t(), String.t()) :: [item()]
  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item ->
      %{item | name: String.replace(item.name, old_word, new_word)}
    end)
  end

  @spec increase_quantity(item(), non_neg_integer()) :: item()
  def increase_quantity(item, count) do
    %{item | quantity_by_size: Map.new(item.quantity_by_size, fn {k, v} -> {k, v + count} end)}
  end

  @spec total_quantity(item()) :: non_neg_integer()
  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_, v}, acc -> acc + v end)
  end
end
