defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t

  def convert(number) do
    number
    |> prime_factors
    |> Enum.sort
    |> speak
    |> List.to_string
  end

  def prime_factors(n) do
    prime_factorsUnder7(n, 1, [])
  end

  defp prime_factorsUnder7(n, i, factors) when i > 7, do: [ n | factors ]
  defp prime_factorsUnder7(n, i, factors) when i > n, do: factors
  defp prime_factorsUnder7(n, i, factors) when rem(n, i) == 0 do
    prime_factorsUnder7(n, i + 1, [ i | factors ])
  end
  defp prime_factorsUnder7(n, i, factors), do: prime_factorsUnder7(n, i + 1, factors)


  def speak(list), do: speak(list, Enum.max(list))

  def speak([], max), do: Integer.to_charlist(max)
  def speak([ 3 | rest ], max), do: 'Pling' ++ speakNoMax(rest)
  def speak([ 5 | rest ], max), do: 'Plang' ++ speakNoMax(rest)
  def speak([ 7 | rest ], max), do: 'Plong'
  def speak([ _first | rest ], max), do: speak(rest, max)
  

  defp speakNoMax([]), do: ''
  defp speakNoMax([ 5 | rest ]), do: 'Plang' ++ speakNoMax(rest)
  defp speakNoMax([ 7 | _rest ]), do: 'Plong'
  defp speakNoMax([ _first | rest ]), do: speakNoMax(rest)

end
