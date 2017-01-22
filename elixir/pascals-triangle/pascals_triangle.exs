defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]

  def rows(num), do: rows(num, [])

  def rows(0, acc), do: acc

  def rows(num, acc) do
    rows(num-1, [ get_row(num) | acc ])
  end

  defp get_row(num) do
    0..num-1
    |> Enum.map(&binomial(num-1, &1))
  end

  defp binomial(_n, 0), do: 1
  defp binomial(n, n), do: 1

  defp binomial(n, k) do
    binomial(n-1, k-1) + binomial(n-1, k)
  end

end
