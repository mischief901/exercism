defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: { integer, integer }) :: any
  def create(direction \\ :north, position \\ {0, 0}) 
  def create(direction, position) when direction in [:north, :south, :east, :west] do
    cond do
      valid_position?(position) ->
        %{direction: direction, position: position}
      true -> 
        {:error, "invalid position"}
    end
  end
  def create(_direction, _position), do: {:error, "invalid direction"}

  defp valid_position?({pos_x, pos_y}) do
    is_integer(pos_x) and is_integer(pos_y)
  end
  defp valid_position?(_position), do: false

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t ) :: any
  def simulate(robot, ""), do: robot
  def simulate(robot, "R" <> <<rest::binary>>) do
    Map.update!(robot, :direction, &turn_right/1)
    |> simulate(rest)
  end
  def simulate(robot, "L" <> <<rest::binary>>) do
    Map.update!(robot, :direction, &turn_left/1)
    |> simulate(rest)
  end
  def simulate(robot, "A" <> <<rest::binary>>) do
    direction = Map.get(robot, :direction)
    Map.update!(robot, :position, fn x -> advance_one(direction, x) end)
    |> simulate(rest)
  end
  def simulate(robot, _invalid_moves), do: {:error, "invalid instruction"}

  defp turn_left(:south), do: :east
  defp turn_left(:north), do: :west
  defp turn_left(:east), do: :north
  defp turn_left(:west), do: :south

  defp turn_right(:south), do: :west
  defp turn_right(:north), do: :east
  defp turn_right(:east), do: :south
  defp turn_right(:west), do: :north

  defp advance_one(:north, {pos_x, pos_y}), do: {pos_x, pos_y + 1}
  defp advance_one(:south, {pos_x, pos_y}), do: {pos_x, pos_y - 1}
  defp advance_one(:east, {pos_x, pos_y}), do: {pos_x + 1, pos_y}
  defp advance_one(:west, {pos_x, pos_y}), do: {pos_x - 1, pos_y}

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot.direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: { integer, integer }
  def position(robot) do
    robot.position
  end
end
