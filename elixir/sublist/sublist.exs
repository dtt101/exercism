defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b -> :equal
      b == [nil] -> :sublist
      a == [nil] -> :superlist
      is_sublist(b,a) -> :superlist
      is_sublist(a,b) -> :sublist
      a != b -> :unequal
    end
  end

  defp is_sublist(a, b) do
    Stream.chunk(b, length(a), 1)
    |> Enum.any?(fn(x) -> x === a end)
  end

end
