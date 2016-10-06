defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    String.split(string, "", trim: true)
    |> Enum.chunk_by(fn(x) -> x end)
    |> Enum.map_join("", fn(x) -> rle_from_list(x) end)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    String.split(string, ~r/\d/)
  end

  defp rle_from_list(s) do
    List.to_string(s)
    |> String.replace(", ", "")
    |> prefix_with_length
  end

  defp prefix_with_length(s) do
    to_string(String.length(s)) <> String.first(s)
  end

end
