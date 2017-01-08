defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.replace(~r/\s+/, "")
    |> String.downcase
    |> String.codepoints
    |> get_value(0)
  end

  defp get_value([], acc) do
    acc
  end

  defp get_value([hd | tl], acc) do
    get_value(tl, acc + points(hd))
  end

  defp points(char) when char in ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"] do
    1
  end

  defp points(char) when char in ["d", "g"] do
    2
  end

  defp points(char) when char in ["b", "c", "m", "p"] do
    3
  end

  defp points(char) when char in ["f", "h", "v", "w", "y"] do
    4
  end

  defp points(char) when char == "k" do
    5
  end

  defp points(char) when char == "j" or
                         char == "x" do
    8
  end

  defp points(char) when char == "q" or
                         char == "z" do
    10
  end
end
