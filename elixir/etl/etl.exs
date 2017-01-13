defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(map) :: map
  def transform(input) do
    Map.to_list(input) |> create_new
  end

  defp create_new(input_list), do: create_new(Map.new(), input_list)

  defp create_new(map, []), do: map
  defp create_new(map, [ {_value, []} | entries ]), do: create_new(map, entries)

  defp create_new(map, [ {value, [ key | keys ]} | entries ]) do
    Map.put(map, String.downcase(key), value)
    |> create_new([ {value, keys} | entries ])
  end
end
