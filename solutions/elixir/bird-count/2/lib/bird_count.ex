defmodule BirdCount do
  def today(list) do
    case list do
      [] -> nil
      [f | _] -> f
    end
  end

  def increment_day_count(list) do
    case list do
      [] -> [1]
      [f | rest] -> [f + 1 | rest]
    end
  end

  defp has_entry_with_zero_value?(list) do
    case list do
      [] -> false
      [entry | _] when entry == 0 -> true
      [_ | rest] -> has_day_without_birds?(rest)
    end
  end

  def has_day_without_birds?(list) do
    # Please implement the has_day_without_birds?/1 function
    has_entry_with_zero_value?(list)
  end

  defp count_total(list, acc) do
    case list do
      [] -> acc
      [entry | rest] -> count_total(rest, acc + entry)
    end
  end

  def total(list) do
    count_total(list, 0)
  end

  defp count_busy_days(list, acc) do
    case list do
      [] -> acc
      [entry | rest] when entry >= 5 -> count_busy_days(rest, acc + 1)
      [_ | rest] -> count_busy_days(rest, acc)
    end
  end

  def busy_days(list) do
    count_busy_days(list, 0)
  end
end
