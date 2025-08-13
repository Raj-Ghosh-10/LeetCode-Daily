defmodule Solution do
  @spec is_power_of_three(n :: integer) :: boolean
  def is_power_of_three(n), do: inner(n, 0)

  @spec inner(n :: integer, r:: integer) :: boolean
  defp inner(_, r) when r != 0, do: false
  defp inner(n, _) when n < 1, do: false
  defp inner(1, 0), do: true
  defp inner(n, _), do: inner(div(n, 3), rem(n, 3))
end