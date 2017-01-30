defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    2..limit
    |> Enum.to_list
    |> sieve([])
  end

  defp sieve([], checked), do: Enum.reverse(checked)
  defp sieve([ head | rest ], checked) do
    rest
    |> Enum.reject(fn x -> rem(x, head) == 0 end)
    |> sieve([head | checked])
  end
end
