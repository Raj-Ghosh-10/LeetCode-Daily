defmodule Solution do
  @spec k_length_apart(nums :: [integer], k :: integer) :: boolean
  def k_length_apart(nums, k) do
    do_check(nums, k, -1, 0)
  end

  defp do_check([], _k, _prev, _i), do: true

  defp do_check([1 | rest], k, prev, i) do
    if prev != -1 and (i - prev - 1) < k do
      false
    else
      do_check(rest, k, i, i + 1)
    end
  end

  defp do_check([_ | rest], k, prev, i) do
    do_check(rest, k, prev, i + 1)
  end
end