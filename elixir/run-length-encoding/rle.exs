defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    Regex.scan(~r/(.)\1{0,}/, string)
    |> count # count and join could be combined, but this is easier to read IMO.
    |> join
    |> List.to_string
  end

  def count([]), do: []
  def count([ [ string, letter ] | rest ]) do
    [ [ String.length(string), letter ] | count(rest) ]
  end

  def join([]), do: ''
  def join([ [ count, letter ] | rest ]) do
    Integer.to_charlist(count) ++ String.to_charlist(letter) ++ join(rest)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    String.split(string, ~r/\d+/, include_captures: true, trim: true)
    |> expand
  end

  def expand([]), do: ""
  def expand([ a, b | rest ]) do
    String.duplicate(b, String.to_integer(a)) <> expand(rest)
  end

end
