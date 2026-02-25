defmodule WineCellar do
  def explain_colors do
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  defp match_description({grape_variety, year, country}, {atom, value}) do
    case atom do
      :grape_variety ->
        grape_variety == value

      :year ->
        year == value

      :country ->
        country == value

      _ ->
        false
    end
  end

  def filter(cellar, color, opts \\ []) do
    Keyword.filter(cellar, fn {k, description} ->
      k == color and Enum.all?(opts, &match_description(description, &1))
    end)
    |> Keyword.values()
  end
end
