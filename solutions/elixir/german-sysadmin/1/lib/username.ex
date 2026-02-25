defmodule Username do
  @doc """
  Sanitizes a username by substituting German characters and filtering out invalid characters.

  ## Substitutions
  The following German characters are replaced:
    - ä → ae
    - ö → oe
    - ü → ue
    - ß → ss

  ## Filtering
  Only lowercase ASCII letters (a-z) and underscores (_) are allowed.
  All other characters are removed.

  ## Examples
      iex> Username.sanitize(~c"hällö_wörldß")
      ~c"haelloe_woerldss"

      iex> Username.sanitize(~c"bl123!@#")
      ~c"bl"
  """
  @spec sanitize(charlist()) :: charlist()
  def sanitize(username) do
    username
    |> Enum.filter(fn character ->
      case character do
        ch when ch in [?_, ?ä, ?ö, ?ü, ?ß] -> true
        ch when ch in ?a..?z -> true
        _ -> false
      end
    end)
    |> Enum.flat_map(fn character ->
      case character do
        ?ä -> [?a, ?e]
        ?ö -> [?o, ?e]
        ?ü -> [?u, ?e]
        ?ß -> [?s, ?s]
        ch -> [ch]
      end
    end)
  end
end
