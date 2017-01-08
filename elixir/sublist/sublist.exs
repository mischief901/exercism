defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  def compare(a, b) when length(a) > length(b) do
    superlist(a, b)
  end

  def compare(a, b) when length(b) > length(a) do
    sublist(a, b)
  end

  def compare(a, b) do
    equal(a, b)
  end

  defp sublist([], _) do
    :sublist
  end

  defp sublist([hd | _ta] = a, [hd | tb] = b) do
    b_segment = Stream.take(b, length(a)) |> Enum.to_list

    case equal(a, b_segment) do
      :equal ->
        :sublist
      :unequal ->
        sublist(a, tb)
    end
  end

  defp sublist(a, [_hb | tb] = b) when length(a) < length(b) do
    sublist(a, tb)
  end

  defp sublist(_, _) do
    :unequal
  end

  defp superlist(_, []) do
    :superlist
  end

  defp superlist(a, b) do
    case sublist(b, a) do
      :sublist ->
        :superlist
      :unequal ->
        :unequal
    end
  end

  defp equal([], []) do
    :equal
  end

  defp equal([hd | ta], [hd | tb]) do
    equal(ta, tb)
  end

  defp equal(_, _) do
    :unequal
  end
end
