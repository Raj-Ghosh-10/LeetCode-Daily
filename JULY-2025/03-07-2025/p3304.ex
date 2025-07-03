defmodule Solution do
  @spec kth_character(k :: integer) :: char
  def kth_character(k), do: ?a + no_of_one_bits(k - 1, 0)

  defp no_of_one_bits(0, res), do: res
  defp no_of_one_bits(n, res), do: no_of_one_bits(div(n, 2), res + rem(n, 2))
end