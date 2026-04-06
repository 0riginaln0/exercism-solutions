defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal

  def compare(a, b) when length(a) < length(b) do
    if sublist?(a, b), do: :sublist, else: :unequal
  end

  def compare(a, b) when length(a) > length(b) do
    if sublist?(b, a), do: :superlist, else: :unequal
  end

  def compare(_, _), do: :unequal

  def sublist?(_l1, []), do: false

  def sublist?(l1, [_ | t] = l2) do
    if List.starts_with?(l2, l1), do: true, else: sublist?(l1, t)
  end
end
