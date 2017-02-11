defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]

  def rows(num), do: _rows(num, [])
  def _rows(0, acc), do: acc
  def _rows(num, acc) do
    _rows(num-1, [ get_row(num) | acc ])
  end

  defp get_row(num) do
    0..num-1
    |> Enum.map(&binomial(num-1, &1))
  end

  defp binomial(_n, 0), do: 1
  defp binomial(n, n), do: 1
  defp binomial(n, k) do
    binomial(n, k, 1, 1)
  end
  defp binomial(n, k, k, acc), do: div(acc * (n-k+1), k)
  defp binomial(n, k, i, acc) do
    binomial(n, k, i+1, div(acc * (n-i+1), i))
  end

end
