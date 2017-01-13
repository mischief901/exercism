defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t, integer) :: map

  def add(db, name, grade) do
    case Map.fetch(db, grade) do
      {:ok, name_list} ->
        Map.put(db, grade, [ name | name_list])
      :error ->
        Map.put(db, grade, [ name ])
    end
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t]
  def grade(db, grade) do
    Map.get(db, grade, [])
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(map) :: [{integer, [String.t]}]
  def sort(db) do
    Map.to_list(db)
    |> Enum.sort(fn({x, _}, {y, _}) -> x <= y end)
    |> Enum.map(fn {grade, list} -> {grade, Enum.sort(list)} end)
  end
end
