defmodule Solution do
  @spec is_power_of_two(n :: integer) :: boolean
  def is_power_of_two(n) when n <= 0, do: false
  def is_power_of_two(n) when n == 1, do: true

  def is_power_of_two(n) do
    n == :math.pow(2, log2(n))
  end

  def log2(n) when n > 0 do
    _log2(n, 0)
  end

  defp _log2(1, acc), do: acc

  defp _log2(n, acc) do
    _log2(div(n, 2), acc + 1)
  end
end