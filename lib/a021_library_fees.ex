defmodule LibraryFees do
  def datetime_from_string(string) do
    {:ok, d} = NaiveDateTime.from_iso8601(string)
    d
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    checkout_datetime
    |> NaiveDateTime.to_date()
    |> Date.add(28 + if(before_noon?(checkout_datetime), do: 0, else: 1))
  end

  def days_late(planned_return_date, actual_return_datetime) do
    NaiveDateTime.to_date(actual_return_datetime)
    |> Date.diff(planned_return_date)
    |> Kernel.max(0)
  end

  def monday?(datetime) do
    Date.day_of_week(NaiveDateTime.to_date(datetime)) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    planned_return_date =
      datetime_from_string(checkout)
      |> return_date()

    actual_return_date =
      datetime_from_string(return)

    planned_return_date
    |> days_late(actual_return_date)
    |> Kernel.*(rate)
    |> div(if monday?(actual_return_date), do: 2, else: 1)
    |> trunc
  end
end

# Kernel.tap(&IO.inspect(&1, label: "return_date"))
