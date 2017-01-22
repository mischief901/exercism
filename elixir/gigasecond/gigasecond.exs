defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) :: :calendar.datetime

  def from({{year, month, day}, {hours, minutes, seconds}}) do
    {:ok, date} = NaiveDateTime.new(year, month, day, hours, minutes, seconds)
    NaiveDateTime.add(date, 1000000000)
    |> NaiveDateTime.to_erl
  end
end
