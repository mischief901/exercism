defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    hamming_distance(strand1, strand2, 0)
  end

  def hamming_distance([],[], acc), do: {:ok, acc}
  def hamming_distance(_strand1, [], _acc), do: {:error, "Lists must be the same length"}
  def hamming_distance([], _strand2, _acc), do: {:error, "Lists must be the same length"}

  def hamming_distance([gene | strand1], [gene | strand2], acc) do
    hamming_distance(strand1, strand2, acc)
  end

  def hamming_distance([_gene1 | strand1], [_gene2 | strand2], acc) do
    hamming_distance(strand1, strand2, acc + 1)
  end

end
