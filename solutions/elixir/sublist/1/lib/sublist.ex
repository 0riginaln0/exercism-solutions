defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b -> :equal
      a == [] -> :sublist
      b == [] -> :superlist
      true -> do_compare(a, b)
    end
  end

  def do_compare(a, b) do
    chunks = Enum.chunk_every(b, length(a), 1, :discard)
    if a in chunks do
      :sublist
    else
      chunks = Enum.chunk_every(a, length(b), 1, :discard)
      if b in chunks do
        :superlist
      else
        :unequal
      end
    end
  end
end
