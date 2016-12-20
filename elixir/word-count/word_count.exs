defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    String.replace(sentence, ~r/[.,\/#!$%\^&\*;:{}=\`~()@]+/, "") # removes all punctuation
    |> String.downcase # to lower case
    |> split # splits sentence into list of words
    |> countMap # puts words in map and applies count
  end

  def split(sentence) do
    String.split(sentence, ~r/[[:blank:]|\_]/, trim: true)
  end

  def countMap(wordEnum) do
    Enum.reduce(wordEnum, %{}, &update_count/2)
  end

  defp update_count(word, acc) do # acc is a map
    Map.update acc, word, 1, &(&1 + 1)
  end

end
