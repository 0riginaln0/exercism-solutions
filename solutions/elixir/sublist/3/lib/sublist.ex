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

  defp do_compare(a, b) do
    b_chunks = Stream.chunk_every(b, length(a), 1, :discard)

    if Enum.any?(b_chunks, &(&1 === a)) do
      :sublist
    else
      a_chunks = Stream.chunk_every(a, length(b), 1, :discard)

      if Enum.any?(a_chunks, &(&1 === b)) do
        :superlist
      else
        :unequal
      end
    end
  end
end
