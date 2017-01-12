defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    number
    |> Integer.digits
    |> convert
  end

  def convert([ ones | _rest ] = number_list) when length(number_list) == 1 do
    roman(ones, "I", "V", "X")
  end
  def convert([ tens | rest ] = number_list) when length(number_list) == 2 do
    roman(tens, "X", "L", "C") <> convert(rest)
  end
  def convert([ huns | rest ] = number_list) when length(number_list) == 3 do
    roman(huns, "C", "D", "M") <> convert(rest)
  end
  def convert([ thous | rest ]) when thous <= 3 do
    roman(thous, "M", "", "") <> convert(rest)
  end

  def roman(num, ones, _five, _ten) when num <= 3 do
    String.duplicate(ones, num)
  end
  def roman(num, ones, five, _ten) when num <= 5 do
    String.duplicate(ones, 5 - num) <> five
  end
  def roman(num, ones, five, _ten) when num <= 8 do
    five <> String.duplicate(ones, num - 5)
  end
  def roman(num, ones, _five, ten) when num <= 10 do
    String.duplicate(ones, 10 - num) <> ten
  end
end
