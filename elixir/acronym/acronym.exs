defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    String.replace(string, ~r/.(?=[A-Z])/, " ")
    |> split
    |> first
    |> String.upcase
  end

  def split(string) do
    String.split(string, ~r/[[:blank:]|\_|\-]/, trim: true)
  end

  def first(stringList) do
    Enum.map_join(stringList, "", &String.first/1)
  end

end
