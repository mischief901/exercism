defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(side, side, side) when side > 0, do: { :ok, :equilateral }
  def kind(side, side, side), do: { :error, "all side lengths must be positive" }

  def kind(side1, side2, side3) when side1 > 0 and
                                     side2 > 0 and 
                                     side3 > 0 do
    Enum.sort([side1, side2, side3]) |> check_sides
  end

  def kind(_side1, _side2, _side3) do 
    { :error, "all side lengths must be positive" }
  end

  def check_sides([a, b, c] = sides) when a + b > c do
      {:ok, find_type(sides)}
  end
  def check_sides(_sides), do: {:error, "side lengths violate triangle inequality" }

  def find_type([equal, equal, not_equal]), do: :isosceles
  def find_type([not_equal, equal, equal]), do: :isosceles
  def find_type([side_A, side_B, side_C]), do: :scalene

end
