defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim_leading()
    |> String.first()
  end

  def initial(name) do
    String.upcase(first_letter(name)) <> "."
  end

  def initials(full_name) do
    [firstname, lastname] = String.split(full_name) |> Enum.map(&initial/1)
    "#{firstname} #{lastname}"
  end

  def pair(full_name1, full_name2) do
    """
    ❤-------------------❤
    |  #{initials(full_name1)}  +  #{initials(full_name2)}  |
    ❤-------------------❤
    """
  end
end
