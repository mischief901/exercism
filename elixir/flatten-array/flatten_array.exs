defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten([ hd | tl ] = list) when is_list(list) do
    cond do
      is_list(hd) -> 
        flatten(hd) ++ flatten(tl)
      is_nil(hd) ->
        flatten(tl)
      true ->
        [hd] ++ flatten(tl)
    end
  end
  
  def flatten(value), do: value


end
