defmodule Bob do
  def hey(input) do
    cond do
      String.match?(input, ~r/^[0-9](, [0-9])*$/) -> "Whatever."
      String.length(String.trim(input)) == 0 -> "Fine. Be that way!"
      String.ends_with?(input, "?")  -> "Sure."
      String.equivalent?(input, String.upcase(input)) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
