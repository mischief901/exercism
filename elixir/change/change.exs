defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns :error if it is not possible to compute the right amount of coins.
    Otherwise returns the tuple {:ok, map_of_coins}

    ## Examples

      iex> Change.generate(3, [5, 10, 15])
      :error

      iex> Change.generate(18, [1, 5, 10])
      {:ok, %{1 => 3, 5 => 1, 10 => 1}}

  """

  @spec generate(integer, list) :: {:ok, map} | :error
  def generate(amount, []), do: :error
  def generate(amount, list) do
    list
    |> Enum.sort(&(&1 >= &2)) # sort list in descending order
    |> change_of(amount)
  end

  def change_of(list, amount) do
    coins = Map.new(list, fn x -> {x, 0} end) # creates map initialized at 0 for all coins
    change_of(list, amount, coins)
  end

  def change_of(_list, 0, coins), do: {:ok, coins}
  def change_of([], amount, coins) when amount > 0, do: :error

  def change_of([ coin | rest ], amount, coins) when amount >= coin do
    new_coins = Map.put(coins, coin, div(amount, coin))
    case change_of(rest, rem(amount, coin), new_coins) do
      :error ->
        change_of(rest, amount, coins)
      {:ok, _} ->
        change_of(rest, rem(amount, coin), new_coins)
    end
  end

  def change_of([ coin | rest ], amount, coins) do
    change_of(rest, amount, coins)
  end

end
