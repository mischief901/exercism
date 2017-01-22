defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """

  @spec frequency([String.t], pos_integer) :: map
  def frequency(texts, workers) do
    stream = Task.async_stream(texts, &count_letters/1, max_concurrency: workers)

    Enum.reduce(stream, %{}, fn {:ok, map}, acc ->
      Map.merge(map, acc, fn _, v1, v2 -> v1 + v2 end)
    end)
  end

  @spec count_letters(String.t) :: map
  def count_letters(""), do: %{}
  def count_letters(text) do
    String.replace(text, ~r/[\d\W\_]/u, "")
    |> String.downcase
    |> String.codepoints
    |> Enum.reduce(Map.new(), fn (x, acc) ->
                    Map.update(acc, x, 1, &(&1 + 1)) end)
  end

end
