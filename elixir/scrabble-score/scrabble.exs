defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    cond do
      Regex.match?(~r/\w/, word) -> calculate_score(word)
      true -> 0
    end
  end

  defp calculate_score(word) do
    String.downcase(word)
    |> String.split("", trim: true)
    |> Enum.map_reduce(0, fn(x, acc) -> { x, to_score(x) + acc} end)
    |> elem(1)
  end

  defp to_score(letter) do
    cond do
      Regex.match?(~r/[aeioulnrst]/, letter) -> 1
      Regex.match?(~r/[dg]/, letter) -> 2
      Regex.match?(~r/[bcmp]/, letter) -> 3
      Regex.match?(~r/[fhvwy]/, letter) -> 4
      Regex.match?(~r/[k]/, letter) -> 5
      Regex.match?(~r/[jx]/, letter) -> 8
      Regex.match?(~r/[qz]/, letter) -> 10
      true -> 0
    end

  end
end
