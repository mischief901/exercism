defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  # check's empty list
  def search({}, _key), do: :not_found
  def search(numbers, key) when is_tuple(numbers) do
    search(Tuple.to_list(numbers), key, 0)
  end

  def search([], key, _length), do: :not_found
  def search(list, key, preceding_index) do
    {first_half, second_half} = Enum.split(list, div(length(list), 2))
    middle = hd(second_half)
    cond do 
      middle < key ->
        search(tl(second_half), key, length(first_half)+1)
      middle > key -> 
        search(first_half, key, 0)
      true -> {:ok, div(length(list), 2) + preceding_index}
    end
  end
end
