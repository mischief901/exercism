defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    |> String.replace(~r/[^\{\}\[\]\(\)]*/, "")
    |> String.codepoints
    |> check_char([])
  end

  def check_char([], []), do: true

  def check_char([ open | rest ], stack) when open == "[" or
                                       open == "(" or
                                       open == "{" do
    check_char(rest, [open | stack ])
  end
  
  def check_char([ ")" | rest ], [ "(" | stack ]), do: check_char(rest, stack)
  def check_char([ "]" | rest ], [ "[" | stack ]), do: check_char(rest, stack)
  def check_char([ "}" | rest ], [ "{" | stack ]), do: check_char(rest, stack)

  def check_char(_string, _stack), do: false

end
