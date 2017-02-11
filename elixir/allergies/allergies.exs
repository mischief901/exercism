defmodule Allergies do
  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t]
  def list(flags), do: list(flags, [])
  def list(flags, acc) when flags >= 256, do: list(flags-256, acc)
  def list(flags, acc) when flags >= 128, do: list(flags-128, ["cats" | acc])
  def list(flags, acc) when flags >= 64, do: list(flags-64, ["pollen" |acc])
  def list(flags, acc) when flags >= 32, do: list(flags-32, ["chocolate" | acc])
  def list(flags, acc) when flags >= 16, do: list(flags-16, ["tomatoes" | acc])
  def list(flags, acc) when flags >= 8, do: list(flags-8, ["strawberries" | acc])
  def list(flags, acc) when flags >= 4, do: list(flags-4, ["shellfish" | acc])
  def list(flags, acc) when flags >= 2, do: list(flags-2, ["peanuts" | acc])
  def list(flags, acc) when flags == 1, do: list(flags-1, ["eggs" | acc])
  def list(0, acc), do: acc

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t) :: boolean
  def allergic_to?(flags, item) do
    item in list(flags)
  end
end
