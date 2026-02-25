defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    [_ | rest] = list
    rest
  end

  def first(list) do
    [f | _] = list
    f
  end

  defp do_count(list, acc) do
    case list do
      [] -> acc
      [f | rest] -> do_count(rest, acc + 1)
    end
  end

  def count(list) do
    do_count(list, 0)
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
