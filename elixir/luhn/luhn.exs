defmodule Luhn do
  @doc """
  Calculates the total checksum of a number
  """
  @spec checksum(String.t()) :: integer
  def checksum(number) do
    number
    |> String.to_integer
    |> Integer.digits
    |> Enum.reverse
    |> double_every_two([])
    |> Enum.sum
  end

  def double_every_two([ first, second | rest ], acc) when second >= 5 do
    double_every_two(rest, [ second * 2 - 9, first | acc])
  end
  def double_every_two([ first, second | rest ], acc) when second < 5 do
    double_every_two(rest, [ second * 2, first | acc])
  end

  def double_every_two([ first | rest ], acc), do: [ first | acc ]
  def double_every_two([], acc), do: acc

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    case rem(checksum(number), 10) do
      0 -> true
      _ -> false
    end
  end

  @doc """
  Creates a valid number by adding the correct
  checksum digit to the end of the number
  """
  @spec create(String.t()) :: String.t()
  def create(number) do
    0..9
    |> Enum.to_list
    |> Enum.map(&Integer.to_string/1)
    |> Enum.map(fn x -> number <> x end)
    |> Enum.find(&valid?/1)
  end
end
