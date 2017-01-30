defmodule Atbash do
  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t) :: String.t
  def encode(plaintext) do
    plaintext
    |> String.downcase
    |> String.replace(~r/[^\da-z]/, "")
    |> String.to_charlist
    |> convert([])
    |> Enum.chunk(5, 5, [])
    |> Enum.join(" ")
  end

  defp convert([], acc), do: acc
  defp convert([ letter | rest ], acc) when letter <= 122 and letter >= 97 do
    convert(rest, acc ++ [ 219 - letter ])
  end
  defp convert([ number | rest ], acc) do
    convert(rest, acc ++ [ number ])
  end

end
