defmodule Queens do
  @type t :: %Queens{ black: {integer, integer}, white: {integer, integer} }
  defstruct black: nil, white: nil

  @doc """
  Creates a new set of Queens
  """
  @spec new() :: Queens.t()
  def new(), do: new({0, 3},{7, 3})

  @spec new({integer, integer}, {integer, integer}) :: Queens.t()
  def new(same_position, same_position), do: raise ArgumentError

  def new(white, black) do
    queens = Map.new()
    |> Map.put(:white, white)
    |> Map.put(:black, black)
  end

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(queens) do
    new_board(queens.white, queens.black)
    |> Enum.map(&Enum.join(&1, " "))
    |> Enum.join("\n")
  end

  def new_board(white, black) do
    rows = 0..7
    cols = 0..7
    for row <- rows do
      for col <- cols do
        cond do
          {row, col} == white ->
            "W"
          {row, col} == black ->
            "B"
          true ->
            "_"
        end
      end
    end
  end

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(queens) do
    check?(queens.white, queens.black)
  end

  def check?({row, col_white}, {row, col_black}), do: true
  def check?({row_white, col}, {row_black, col}), do: true
  def check?({row_white, col_white}, {row_black, col_black}) do
    abs(row_white - row_black) == abs(col_white - col_black)
  end
  def check?(_white, _black), do: false
end
