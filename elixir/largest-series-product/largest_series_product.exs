defmodule Series do

  @doc """
  Finds the largest product of a given number of consecutive numbers in a given string of numbers.
  """
  @spec largest_product(String.t, non_neg_integer) :: non_neg_integer
  def largest_product(_number_string, 0), do: 1
  def largest_product(number_string, size) when size > 0 do
    number_string
    |> String.codepoints
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk(size, 1)
    |> Enum.map(&product/1)
    |> Enum.max(fn -> raise ArgumentError end)
  end

  def largest_product(_number_string, _size) do
    raise ArgumentError
  end

  defp product(list) do
    Enum.reduce(list, 1, &(*/2))
  end
end
