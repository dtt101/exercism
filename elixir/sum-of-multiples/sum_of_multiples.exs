defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    1..(limit - 1)
    |> Stream.filter(fn(x) -> multiple_for(x, factors) end)
    |> Enum.sum
  end

  defp multiple_for(n, factors) do
    Enum.any?(factors, fn(x) -> rem(n, x) == 0 end)
  end

end
