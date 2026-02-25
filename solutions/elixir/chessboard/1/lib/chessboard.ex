defmodule Chessboard do
  def rank_range do
    1..8
  end

  def file_range do
    ?A..?H
  end

  def ranks do
    Range.to_list(rank_range())
  end

  def files do
    file_range()
    |> Range.to_list()
    |> List.to_string()
    |> String.codepoints()
  end
end
