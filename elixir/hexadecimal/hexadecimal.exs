defmodule Hexadecimal do
  @doc """
    Accept a string representing a hexadecimal value and returns the
    corresponding decimal value.
    It returns the integer 0 if the hexadecimal is invalid.
    Otherwise returns an integer representing the decimal value.

    ## Examples

      iex> Hexadecimal.to_decimal("invalid")
      0

      iex> Hexadecimal.to_decimal("af")
      175

  """

  @spec to_decimal(binary) :: integer
  def to_decimal(hex) do
    hex
    |> String.downcase
    |> from_hex
  end

  def from_hex(str, dec \\ 0)
  def from_hex(<<first>> <> rest, acc) when first in ?0..?9 do
    from_hex(rest, acc * 16 + first - ?0)
  end

  def from_hex(<<first>> <> rest, acc) when first in ?a..?f do
    from_hex(rest, acc * 16 + first - ?a + 10)
  end
  def from_hex("", dec), do: dec
  def from_hex(_, _), do: 0
end
