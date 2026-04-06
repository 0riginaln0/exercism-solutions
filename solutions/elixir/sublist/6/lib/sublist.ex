defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b -> :equal
      length(a) < length(b) and sublist?(a, b) -> :sublist
      length(a) > length(b) and sublist?(b, a) -> :superlist
      :else -> :unequal
    end
  end

  def sublist?(_l1, []), do: false

  def sublist?(l1, [_ | t] = l2) do
    if List.starts_with?(l2, l1), do: true, else: sublist?(l1, t)
  end
end
