defmodule CaptainsLog do
  @moduledoc false

  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]
  @starship_registry_numbers 1000..9999
  @stardate_min 41_000.0
  @stardate_max 42_000.0

  def random_planet_class() do
    Enum.random(@planetary_classes)
  end

  def random_ship_registry_number() do
    "NCC-#{Enum.random(@starship_registry_numbers)}"
  end

  def random_stardate() do
    @stardate_min + (:rand.uniform() * (@stardate_max - @stardate_min))
  end

  def format_stardate(stardate) do
    :io_lib.format("~.1f", [stardate]) |> to_string()
  end
end
