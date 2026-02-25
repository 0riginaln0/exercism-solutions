defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: d}) do
    "#{d} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: b}) do
    if b == 0, do: "Battery empty", else: "Battery at #{b}%"
  end

  def drive(%RemoteControlCar{battery_percentage: 0} = rcc), do: rcc
  def drive(%RemoteControlCar{} = rcc) do
    %RemoteControlCar{rcc |
       battery_percentage: rcc.battery_percentage - 1,
       distance_driven_in_meters: rcc.distance_driven_in_meters + 20
    }
  end
end
