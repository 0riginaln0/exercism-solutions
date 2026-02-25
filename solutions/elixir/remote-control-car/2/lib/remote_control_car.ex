defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: meters}) do
    "#{meters} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: percentage}) do
    if percentage == 0, do: "Battery empty", else: "Battery at #{percentage}%"
  end

  def drive(
        %RemoteControlCar{
          distance_driven_in_meters: distance,
          battery_percentage: battery_percentage
        } = car
      ) do
    if battery_percentage == 0 do
      car
    else
      %{
        car
        | distance_driven_in_meters: distance + 20,
          battery_percentage: battery_percentage - 1
      }
    end
  end
end
