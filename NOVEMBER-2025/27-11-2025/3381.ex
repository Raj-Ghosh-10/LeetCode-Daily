defmodule Solution do
  @spec max_subarray_sum(nums :: [integer], k :: integer) :: integer
  def max_subarray_sum(nums, k) do
    inf = :math.pow(2, 60) |> trunc()
    min_prefix = :array.new(k, {:default, inf})
    min_prefix = :array.set(0, 0, min_prefix)

    {answer, _prefix, _min_prefix} =
      Enum.reduce(Enum.with_index(nums), {-inf, 0, min_prefix}, fn {x, i}, {ans, prefix, mp} ->
        prefix = prefix + x
        mod = rem(i + 1, k)
        current_ans = max(ans, prefix - :array.get(mod, mp))
        mp = :array.set(mod, min(prefix, :array.get(mod, mp)), mp)
        {current_ans, prefix, mp}
      end)

    answer
  end
end