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
  def meetup(year, month, weekday, :teenth) do
    meetup(year, month, weekday, 13..19)
  end

  def meetup(year, month, weekday, :first) do
    meetup(year, month, weekday, 1..7)
  end

  def meetup(year, month, weekday, :second) do
    meetup(year, month, weekday, 8..14)
  end
  
  def meetup(year, month, weekday, :third) do
    meetup(year, month, weekday, 15..21)
  end

  def meetup(year, month, weekday, :fourth) do
    meetup(year, month, weekday, 22..28)
  end

  def meetup(year, month, weekday, :last) do
    last_day = Date.new(year, month, 1) |> elem(1) |> Date.days_in_month
    meetup(year, month, weekday, (last_day - 6)..last_day)
  end
    
  def meetup(year, month, weekday, range) do
    range
    |> Enum.to_list
    |> Enum.map(&(Date.new(year, month, &1)))
    |> Enum.find(fn({:ok, date}) -> valid?(date, weekday) end)
    |> elem(1)
    |> Date.to_erl
  end

  def valid?(date, :monday),    do: Date.day_of_week(date) === 1
  def valid?(date, :tuesday),   do: Date.day_of_week(date) === 2
  def valid?(date, :wednesday), do: Date.day_of_week(date) === 3
  def valid?(date, :thursday),  do: Date.day_of_week(date) === 4
  def valid?(date, :friday),    do: Date.day_of_week(date) === 5
  def valid?(date, :saturday),  do: Date.day_of_week(date) === 6
  def valid?(date, :sunday),    do: Date.day_of_week(date) === 7
end
