defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t) :: String.t
  # moved all regex statements into parse pipeline. Simplified regex.
  def parse(text) do
    text
    |> String.split("\n")
    |> Enum.map(&process/1)
    |> Enum.join
    |> String.replace(~r/\_\_/, "<strong>", global: false)
    |> String.replace(~r/\_\_/, "</strong>")
    |> String.replace(~r/\_/, "<em>", global: false)
    |> String.replace(~r/\_/, "</em>")
    |> String.replace("<li>", "<ul>" <> "<li>", global: false)
    |> String.replace_suffix("</li>", "</li>" <> "</ul>")
  end

  # Pattern match on start of string instead of conditional statements.
  defp process("* " <> list_body = _text) do
    "<li>#{list_body}</li>"
  end

  defp process("#" <> rest = _text) do
    header_count(rest, 1)
  end

  defp process(text) do
    "<p>#{text}</p>"
  end
  
  # Rewrote parse_header_md_level as a recursive function that pattern matched 
  # on the start of the string and combined with enclose_with_header_tag on conclusion.
  defp header_count("#" <> header_text, count) do
    header_count(header_text, count + 1)
  end
  
  defp header_count(" " <> header_text, count) do 
    "<h#{to_string(count)}>" <> header_text <> "</h#{to_string(count)}>"
  end

end
