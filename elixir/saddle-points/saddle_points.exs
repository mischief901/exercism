defmodule Matrix do
  @doc """
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t()) :: [[integer]]
  def rows(str) do
    str
    |> String.split(~r/\n/, trim: true)
    |> Enum.map(&String.split/1)
    |> Enum.map(&Enum.map(&1, fn x -> String.to_integer(x) end))
  end

  @doc """
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t()) :: [[integer]]
  def columns(str) when is_binary(str) do
    rows(str)
    |> transpose
  end

  defp transpose([[]|_]), do: []
  defp transpose(list) do
    [Enum.map(list, &hd/1) | transpose(Enum.map(list, &tl/1))]
  end

  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(str) do
    rows = rows(str)
    cols = columns(str)

    saddle(rows, cols)
    |> Enum.map(&Enum.find(&1, [], fn x -> is_tuple(x) end))
    |> Enum.filter(&is_tuple/1)
  end

  # this isn't a particularly good functional approach

  def saddle(rows, cols) do
    for row <- 0..length(rows)-1 do
      for col <- 0..length(cols)-1 do
        cond do
          Enum.min(Enum.at(cols, col)) == Enum.max(Enum.at(rows, row)) ->
            {row, col}
          true ->
            nil
        end
      end
    end
  end

end
