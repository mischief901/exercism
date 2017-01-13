defmodule Garden do
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """
#- Alice, Bob, Charlie, David,
#- Eve, Fred, Ginny, Harriet,
#- Ileana, Joseph, Kincaid, and Larry.

  @kids [ :alice, :bob, :charlie, :david, :eve, :fred, :ginny, :harriet, :ileana, :joseph, :kincaid, :larry ]

  @spec info(String.t(), list) :: map
  def info(info_string, student_names) do
    info_string
    |> String.split(~r/\n/)
    |> parse_to_atoms
    |> assign(Enum.sort(student_names))
  end
  def info(info_string), do: info(info_string, @kids)

  def parse_to_atoms([ row1 | [row2] ]) do
    {parse(String.codepoints(row1)), parse(String.codepoints(row2))}
  end

  def parse([]), do: []
  def parse([ "R" | rest ]), do: [ :radishes | parse(rest) ]
  def parse([ "V" | rest ]), do: [ :violets  | parse(rest) ]
  def parse([ "C" | rest ]), do: [ :clover   | parse(rest) ]
  def parse([ "G" | rest ]), do: [ :grass    | parse(rest) ]

  def assign({row1, row2}, names), do: assign(Map.new(), {row1, row2}, names)

  def assign(db, {[],[]}, []), do: db

  def assign(db, {[],[]}, [student | class]) do
    Map.put(db, student, {})
    |> assign({[],[]}, class)
  end
  def assign(db, {[plant1, plant2 | row1], [plant3, plant4 | row2 ]}, [student | class]) do
    Map.put(db, student, {plant1, plant2, plant3, plant4})
    |> assign({row1, row2}, class)
  end

  # split info_string into two strings for each row
  # parse each string in order
  # get atoms for each plant
  # assign to name in map
  
end
