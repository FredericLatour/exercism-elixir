defmodule KitchenCalculator do
  def get_volume({_, volume}), do: volume

  def to_milliliter({:cup, volume}) do
    {:milliliter, volume * 240}
  end

  def to_milliliter({:fluid_ounce, volume}) do
    {:milliliter, volume * 30}
  end

  def to_milliliter({:teaspoon, volume}) do
    {:milliliter, volume * 5}
  end

  def to_milliliter({:tablespoon, volume}) do
    {:milliliter, volume * 15}
  end

  def to_milliliter({:milliliter, volume}) do
    {:milliliter, volume}
  end

  def from_milliliter(volume_pair, :cup = unit) do
    {unit, get_volume(volume_pair) / 240}
  end

  def from_milliliter(volume_pair, :fluid_ounce = unit) do
    {unit, get_volume(volume_pair) / 30}
  end

  def from_milliliter(volume_pair, :teaspoon = unit) do
    {unit, get_volume(volume_pair) / 5}
  end

  def from_milliliter(volume_pair, :tablespoon = unit) do
    {unit, get_volume(volume_pair) / 15}
  end

  def from_milliliter(volume_pair, :milliliter = unit) do
    {unit, get_volume(volume_pair)}
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair) |> from_milliliter(unit)
  end
end
