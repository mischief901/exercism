defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna = [ nuct | strand ]) do
    rna(nuct) ++ to_rna(strand)
  end
  def to_rna([]), do: []

  def rna(?A), do: 'U'
  def rna(?T), do: 'A'
  def rna(?G), do: 'C'
  def rna(?C), do: 'G'

end
