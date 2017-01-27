defmodule Diamond do
  @doc """
  Given a letter, it prints a diamond starting with 'A',
  with the supplied letter at the widest point.
  """
  @spec build_shape(char) :: String.t
  def build_shape(letter) do
    ?A..letter
    |> Enum.concat(letter..?A)
    |> Enum.dedup
    |> Enum.to_list
    |> to_string
    |> String.codepoints
    |> print_diamond
  end

  def print_diamond(list) do
    print_diamond(list, 0, div(length(list), 2), [])
  end

  def print_diamond([first | rest], inner_spaces, outer_spaces, []) do
    spaces = String.duplicate("\s", outer_spaces)
    row = spaces <> first <> spaces <> "\n"
    print_diamond(rest, inner_spaces + 1, outer_spaces - 1, [row])
  end

  def print_diamond([next | rest] = list, inner_spaces, outer_spaces, rows) when length(list) > length(rows) and outer_spaces > 0 do
    spaces = String.duplicate("\s", outer_spaces)
    spaces_inner = String.duplicate("\s", inner_spaces)
    next_row = spaces <> next <> spaces_inner <> next <> spaces <> "\n"

    print_diamond(rest, inner_spaces + 2, outer_spaces - 1, [next_row | rows])
  end

  def print_diamond([next | rest] = list, inner_spaces, outer_spaces, rows) when length(list) > 1 do
    spaces_inner = String.duplicate("\s", inner_spaces)
    spaces = String.duplicate("\s", outer_spaces)
    next_row = spaces <> next <> spaces_inner <> next <> spaces <> "\n"

    print_diamond(rest, inner_spaces - 2, outer_spaces + 1, [next_row | rows])
  end

  def print_diamond(["A"], inner_spaces, outer_spaces, rows) do
    spaces = String.duplicate("\s", outer_spaces)
    row = spaces <> "A" <> spaces <> "\n"
    print_diamond([], inner_spaces, outer_spaces, [row | rows])
  end

  def print_diamond([], _inner_spaces, _outer_spaces, rows) do
    rows
    |> Enum.reverse
    |> Enum.join("")
  end

end