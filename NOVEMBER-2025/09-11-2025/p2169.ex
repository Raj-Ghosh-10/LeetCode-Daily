defmodule Solution do
  @spec count_operations(n1 :: integer, n2 :: integer) :: integer
  def count_operations(n1, n2), do: count_operations_tail(n1, n2, 0)

  defp count_operations_tail(0, _, result), do: result
  defp count_operations_tail(_, 0, result), do: result
  defp count_operations_tail(a, b, result) when a >= b, do: count_operations_tail(a - b, b, result + 1)
  defp count_operations_tail(a, b, result), do: count_operations_tail(a, b - a, result + 1)
end