defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer

  def to(_limit, []), do: [0]

  def to(limit, list) do
    get_factors(limit, list)
    |> Enum.uniq
    |> List.foldl(0, fn(x, acc) -> x + acc end)
  end

  def get_factors(limit, list) do
    get_factors(limit, list, [0])
  end

  def get_factors(_limit, [], acc), do: acc

  def get_factors(limit, [ head | tail ], acc) do
    factors = 1..limit
      |> Enum.to_list
      |> Enum.filter(fn(x) -> rem(x, head) == 0 && x !== limit end)

    acc = Enum.into(factors, acc)
    get_factors(limit, tail, acc)
  end
end
