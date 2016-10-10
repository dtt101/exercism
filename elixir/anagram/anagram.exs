defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Stream.filter(candidates, fn(x) -> split_sort(base) == split_sort(x) end)
    |> Enum.reject(fn(x) -> String.downcase(x) == String.downcase(base) end)
  end

  defp split_sort(word) do
    String.downcase(word)
    |> String.split("")
    |> Enum.sort
  end
end
