defmodule Wordy do

  @doc """
  Calculate the math problem in the sentence.
  """
  @spec answer(String.t) :: integer
  def answer("What is " <> <<rest::binary>>) do
    rest
    |> String.split(~r/([^-\w])/, trim: true)
    |> get_operation
  end
  def answer(_question), do: raise ArgumentError

  def get_operation([number]=list) when length(list)==1 do
    String.to_integer(number)
  end

  def get_operation([num1, "plus", num2 | rest]) do
    get_operation(["#{String.to_integer(num1) + String.to_integer(num2)}" | rest])
  end
  
  def get_operation([num1, "minus", num2 | rest]) do
    get_operation(["#{String.to_integer(num1) - String.to_integer(num2)}" | rest])
  end
  
  def get_operation([num1, "multiplied", "by", num2 | rest]) do
    get_operation(["#{String.to_integer(num1) * String.to_integer(num2)}" | rest])
  end
  
  def get_operation([num1, "divided", "by", num2 | rest]) do
    get_operation(["#{div(String.to_integer(num1), String.to_integer(num2))}" | rest])
  end

  def get_operation(_), do: raise ArgumentError

end
