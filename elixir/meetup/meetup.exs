defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """

  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, :teenth), do: meetup(year, month, weekday, 13..19)
  def meetup(year, month, weekday, range) do
    range
    |> Enum.to_list
    |> Enum.map(&(Date.new(year, month, &1)))
    |> Enum.find(fn({_, date}) -> valid?(date, weekday) end)
  end

  def valid?(date, :monday),    do: Date.day_of_week(date) === 1
  def valid?(date, :tuesday),   do: Date.day_of_week(date) === 2
  def valid?(date, :wednesday), do: Date.day_of_week(date) === 3
  def valid?(date, :thursday),  do: Date.day_of_week(date) === 4
  def valid?(date, :friday),    do: Date.day_of_week(date) === 5
  def valid?(date, :saturday),  do: Date.day_of_week(date) === 6
  def valid?(date, :sunday),    do: Date.day_of_week(date) === 7
end
