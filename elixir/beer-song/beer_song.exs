defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t

  def verse(number) do
    String.capitalize(get_bottle(number - 1)) <> " on the wall, " <> get_bottle(number - 1) <>".\n" <> get_remaining(number - 1) <> " on the wall.\n"
  end

  def get_bottle(0) do
    "no more bottles of beer"
  end
  
  def get_bottle(1 = number) do
    Integer.to_string(number) <> " bottle of beer"
  end

  def get_bottle(number) do
    Integer.to_string(number) <> " bottles of beer"
  end

  def get_remaining(0) do
    "Go to the store and buy some more, " <> get_bottle(99)
  end

  def get_remaining(1 = number) do
    "Take it down and pass it around, " <> get_bottle(number - 1)
  end

  def get_remaining(number) do
    "Take one down and pass it around, " <> get_bottle(number - 1)
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(range) do
    range
    |> Enum.to_list
    |> Enum.map(&verse(&1))
    |> Enum.join("\n")
  end
  def lyrics(), do: lyrics(100..1)

end
