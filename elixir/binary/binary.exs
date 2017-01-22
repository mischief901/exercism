defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    string
    |> String.reverse
    |> String.codepoints
    |> to_decimal(0, 0)
  end

  def to_decimal([], _n, acc), do: acc

  def to_decimal(["1" | rest], n, acc) do
    to_decimal(rest, n+1, acc + 1 * :math.pow(2, n))
  end

  def to_decimal(["0" | rest], n, acc) do
    to_decimal(rest, n+1, acc)
  end

  def to_decimal(_number, _n, _acc), do: 0
end
