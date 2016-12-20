defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    List.foldl(String.split(sentence, "~r/\W/"), Map.new(), 
        fn(x, y) -> Map.put_new(y, x, 
        Enum.count(String.split(sentence, "~r/\W/"), fn(z) -> x == z end)) end)

  end
end
