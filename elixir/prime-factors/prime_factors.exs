defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    factors_for(number, 2, [])
  end

  def factors_for(1, _check, factors), do: Enum.sort(factors)
  def factors_for(number, check, factors) when rem(number, check) == 0 do
    factors_for(div(number, check), 2, [check | factors])
  end
  def factors_for(number, check, factors) when number < check * check do
    Enum.sort([number | factors])
  end
  def factors_for(number, check, factors) do
    factors_for(number, check + 1, factors)
  end
end
