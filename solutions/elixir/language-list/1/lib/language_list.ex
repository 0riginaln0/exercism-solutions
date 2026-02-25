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

  def count(list) do
    Enum.count(list)
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
