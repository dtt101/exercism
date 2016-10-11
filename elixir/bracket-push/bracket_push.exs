defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    brackets_list = Regex.scan(~r/[\{\[\(\)\]\}]/, str)
    Enum.reduce(brackets_list, Enum.join(brackets_list), fn(x, acc) ->
      Regex.replace(~r/(\{\})|(\(\))|(\[\])/, acc, "")
    end)
    |> String.trim == ""
  end
end
