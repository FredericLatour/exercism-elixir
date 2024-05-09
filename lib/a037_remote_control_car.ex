defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  @type rcc :: %RemoteControlCar{
          nickname: String.t(),
          distance_driven_in_meters: non_neg_integer(),
          battery_percentage: non_neg_integer()
        }

  @spec new(String.t()) :: rcc
  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  @spec display_distance(rcc) :: String.t()
  def display_distance(%RemoteControlCar{} = remote_car) when is_map(remote_car) do
    "#{remote_car.distance_driven_in_meters} meters"
  end

  @spec display_battery(rcc) :: String.t()
  def display_battery(%RemoteControlCar{} = remote_car) when is_map(remote_car) do
    "Battery" <>
      if remote_car.battery_percentage == 0,
        do: " empty",
        else: " at #{remote_car.battery_percentage}%"
  end

  @spec drive(rcc) :: rcc
  def drive(%RemoteControlCar{} = remote_car) when is_map(remote_car) do
    if remote_car.battery_percentage == 0 do
      remote_car
    else
      %{
        remote_car
        | distance_driven_in_meters: remote_car.distance_driven_in_meters + 20,
          battery_percentage: max(remote_car.battery_percentage - 1, 0)
      }
    end
  end
end
