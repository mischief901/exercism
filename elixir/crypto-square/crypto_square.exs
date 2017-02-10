defmodule CryptoSquare do
  @doc """
  Encode string square methods
  ## Examples

    iex> CryptoSquare.encode("abcd")
    "ac bd"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""
  def encode(str) do
    formatted_string = 
    str
    |> String.downcase
    |> String.replace(~r/[^a-z\d]/, "")

    {_rows, cols, rem} =
    formatted_string
    |> String.length
    |> get_square
    
    formatted_string
    |> String.codepoints
    |> create_square(cols, rem)
  end

  defp create_square(list, cols, rem) when is_integer(rem) do
    create_square(list ++ List.duplicate("", rem), cols)
  end
  defp create_square(list, cols) do
    for col <- 0..cols-1 do
      for letter <- 0..length(list)-1 do
        if rem(letter, cols) == col do
          Enum.at(list, letter)
        end
      end
      |> Enum.join("")
    end
    |> Enum.join(" ")
  end

  defp get_square(length), do: add_column(1, 1, length)

  defp add_column(r, c, length) when r * c < length do
    add_row(r, c + 1, length)
  end
  defp add_column(r, c, length) do
    {r, c, abs(length - r * c)}
  end
  defp add_row(r, c, length) when r * c < length do
    add_column(r + 1, c, length)
  end
  defp add_row(r, c, length) do
    {r, c, abs(length - r * c)}
  end

end
