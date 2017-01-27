defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates
    |> remove_duplicates(base)
    |> check_length(base)
    |> Enum.filter(fn(word) ->
      match_letters(String.to_charlist(base), String.to_charlist(word)) end)
  end

  def remove_duplicates([], _base), do: []

  def remove_duplicates([first | rest], base) do
    {:ok, regex_base} = Regex.compile(base, "i")
    cond do
      Regex.match?(regex_base, first) ->
        remove_duplicates(rest, base)
      true ->
        [ first | remove_duplicates(rest, base) ]
    end
  end

  def check_length([], _base), do: []

  def check_length([first | rest], base) do
    cond do
      String.length(first) == String.length(base) ->
        [ first | check_length(rest, base) ]
      true ->
        check_length(rest, base)
    end
  end

  def match_letters([], []), do: true
  def match_letters([], _word), do: false

  def match_letters([ letter | rest ], word) do
    match_letters(rest, word -- [letter, letter + 32, letter - 32])
  end

end
