defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count >= 1 do
    nth(count, 3, [2])
  end

  def nth(1, _check, [ prime | _rest ]), do: prime
  def nth(count, check, primes) do
    cond do
      prime?(check) -> 
        nth(count - 1, check + 2, [ check | primes ])
      true ->
        nth(count, check + 2, primes)
    end
  end

  def prime?(num) do
    divs =
    2..num-1
    |> Enum.filter(&(rem(&1, 2) != 0))
    |> Enum.filter(&(rem(num, &1) == 0))
    |> Enum.to_list
    divs === []
  end
end
