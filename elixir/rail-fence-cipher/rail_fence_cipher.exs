defmodule RailFenceCipher do
  @doc """
  Encode a given plaintext to the corresponding rail fence ciphertext
  """
  @spec encode(String.t, pos_integer) :: String.t
  def encode(str, 1), do: str
  def encode(str, rails) when rails > 1 do
    str
    |> String.codepoints
    |> Enum.chunk(2*rails-2, 2*rails-2, List.duplicate("", rails))
    |> add_rails(0, rails, [])
    |> Enum.reverse
    |> Enum.join("")
  end

  defp add_rails(letters, 0, rails, acc) do
    encrypted = letters
    |> Enum.map(&(Enum.at(&1, 0)))
    |> Enum.join("")
    add_rails(letters, 1, rails, [encrypted | acc])
  end

  defp add_rails(letters, rail, rails, acc) when rail < rails-1 do
    encrypted = 
    for position <- [rail, 2*rails-2-rail] do
      letters
      |> Enum.map(&(Enum.at(&1, position)))
    end
    |> List.zip
    |> Enum.map(&(Tuple.to_list/1))
    |> Enum.join("")
    add_rails(letters, rail + 1, rails, [encrypted | acc])
  end

  defp add_rails(letters, _rail, rails, acc) do
    encrypted =
    letters
    |> Enum.map(&(Enum.at(&1, rails-1)))
    |> Enum.join("")
    [encrypted | acc]
  end

  @doc """
  Decode a given rail fence ciphertext to the corresponding plaintext
  """
  @spec decode(String.t, pos_integer) :: String.t
  def decode(str, 1), do: str
  def decode("", _rails), do: ""
  def decode(str, rails) do
    str
    |> String.codepoints
    |> _decode(rails)
  end

  def _decode(letters, rails) when length(letters) > rails do
    length = length(letters)
    remainder = rem(length, 2*rails-2)
    row_length = div(length, 2*rails-2)
    
    letters
    |> Enum.chunk(row_length, row_length, List.duplicate("", rails))
    |> shift_by_remainder(remainder, [])
    |> combine_middle(rails, [])
    |> build_phrase(0, rails, length, [])
  end
  def _decode(letters, rails), do: letters |> Enum.join("")

  defp shift_by_remainder(list, 0, acc), do: acc ++ list
  defp shift_by_remainder([list1, list2 | rest], rem, acc) do
    shift_by_remainder([tl(list2) | rest], rem, acc ++ [list1 ++ [hd(list2)]])
  end
  defp shift_by_remainder(list, rem, acc) do
    [hd(acc)] ++ shift_by_remainder(tl(acc) ++ list, rem-1, [])
  end

  defp combine_middle(_list, 0, acc), do: acc
  defp combine_middle(list, rails, acc) when rem(length(list), 2) == 1 do
    combine_middle(tl(list), rails-1, acc ++ [hd(list)])
  end
  defp combine_middle([list1, list2 | rest], rails, acc) do
    combine_middle(rest, rails-1, acc ++ [list1 ++ list2])
  end

  defp build_phrase(list, current_rail, rails, str_length, acc) when 
                                      rem(length(acc), 2*rails-2) < rails-1 and 
                                      length(acc) < str_length do
    rail_list = Enum.at(list, current_rail)
    next_letter = add_letter(rail_list, rails, acc)
    build_phrase(list, current_rail+1, rails, str_length, next_letter)
  end
  defp build_phrase(list, current_rail, rails, str_length, acc) when 
                                      rem(length(acc), 2*rails-2) >= rails-1 and
                                      length(acc) < str_length do
    rail_list = Enum.at(list, current_rail)
    next_letter = add_letter(rail_list, rails, acc)
    build_phrase(list, current_rail-1, rails, str_length, next_letter)
  end
  defp build_phrase(_list, _current_rail, _rails, _str_length, acc) do
    acc
    |> Enum.join("")
  end

  defp get_pos(0, length, rails), do: div(length, 2*rails-2)
  defp get_pos(rem, length, rails) when rem == rails-1, do: div(length, 2*rails-2)
  defp get_pos(rem, length, rails) when rem > rails-1, do: 2*div(length, 2*rails-2) + 1
  defp get_pos(rem, length, rails) when rem < rails-1, do: 2*div(length, 2*rails-2)
  
  defp add_letter(list, rails, acc) do
    letter = Enum.at(list, get_pos(rem(length(acc), 2*rails-2), length(acc), rails))
    acc ++ [letter]
  end
end