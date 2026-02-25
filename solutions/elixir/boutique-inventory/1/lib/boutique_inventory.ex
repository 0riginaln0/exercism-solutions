defmodule BoutiqueInventory do
  @type size :: :s | :m | :l | :xl
  @type quantity_by_size :: %{size() => integer()}
  @type product :: %{
          name: String.t(),
          price: number(),
          quantity_by_size: quantity_by_size()
        }

  @spec sort_by_price([product]) :: [product()]
  def sort_by_price(inventory) do
    inventory
    |> Enum.with_index()
    |> Enum.sort_by(fn {item, index} -> {item[:price], index} end)
    |> Enum.map(fn {item, _index} -> item end)
  end

  @spec with_missing_price([product]) :: [product()]
  def with_missing_price(inventory) do
    Enum.filter(inventory, fn %{price: price} -> price == nil end)
  end

  @spec update_names([product], String.t(), String.t()) :: [product()]
  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn %{name: name} = product ->
      %{product | name: String.replace(name, old_word, new_word)}
    end)
  end

  def increase_quantity(%{quantity_by_size: quantity_by_size} = item, count) do
    %{
      item
      | quantity_by_size:
          Enum.map(quantity_by_size, fn {k, v} -> {k, v + count} end)
          |> Enum.into(%{})
    }
  end

  def total_quantity(%{quantity_by_size: quantity_by_size}) do
    quantity_by_size
    |> Map.values()
    |> Enum.sum()
  end
end
