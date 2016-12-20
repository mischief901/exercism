defmodule Bob do
  def hey(input) do
    cond do
        String.strip(input) == "" -> "Fine. Be that way!"
        question?(input) -> "Sure."
        shouting?(input) -> "Whoa, chill out!"
        true -> "Whatever."
    end
  end

  def shouting? (message) do
    message == String.upcase(message)
    && (String.downcase(message) != message)
  end
  def question? (message) do
    String.ends_with?(message, "?")
  end
end
