defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    Regex.scan(~r/[\d]{3,}/, raw)
    |> Enum.join("")
    |> check_length
  end

  def check_length(number) when Kernel.byte_size(number) == 10 do
    number
  end

  def check_length(number) when Kernel.byte_size(number) == 11 do
    cond do
      String.first(number) == "1" -> 
        String.slice(number, 1..10)
      true -> 
        "0000000000"
    end
  end

  def check_length(_), do: "0000000000"


  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    raw
    |> number
    |> String.slice(0..2)
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    ten_digits = number(raw)
    <<area::binary-size(3), middle::binary-size(3), last::binary-size(4)>> = ten_digits
    "(" <> area <> ") " <> middle <> "-" <> last
  end

end
