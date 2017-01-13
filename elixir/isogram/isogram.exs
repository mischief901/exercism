defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    sentence 
    |> String.replace(~r/[\W]+/u, "")
    |> String.to_charlist 
    |> unique?
  end

  def unique?([]), do: true
  def unique?([ letter | rest ]) do
    cond do
      Enum.member?(rest, letter) ->
        false
      true ->
        unique?(rest)
    end
  end
end
