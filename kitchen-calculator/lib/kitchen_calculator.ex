defmodule KitchenCalculator do
  def get_volume({_, volume}), do: volume

  def to_milliliter({:cup, volume}), do: {:milliliter, 240 * volume}
  def to_milliliter({:fluid_ounce, volume}), do: {:milliliter, 30 * volume}
  def to_milliliter({:teaspoon, volume}), do: {:milliliter, 5 * volume}
  def to_milliliter({:tablespoon, volume}), do: {:milliliter, 15 * volume}
  def to_milliliter({:milliliter, volume}), do: {:milliliter, volume}

  def from_milliliter({:milliliter, volume}, :cup), do: {:cup, volume / 240}
  def from_milliliter({:milliliter, volume}, :fluid_ounce), do: {:fluid_ounce, volume / 30}
  def from_milliliter({:milliliter, volume}, :teaspoon), do: {:teaspoon, volume / 5}
  def from_milliliter({:milliliter, volume}, :tablespoon), do: {:tablespoon, volume / 15}
  def from_milliliter({:milliliter, volume}, :milliliter), do: {:milliliter, volume}

  def convert({:milliliter, volume}, unit), do: from_milliliter({:milliliter, volume}, unit)
  def convert(volume_pair, :milliliter), do: to_milliliter(volume_pair)
  def convert(volume_pair, unit), do: to_milliliter(volume_pair) |> from_milliliter(unit)
end
