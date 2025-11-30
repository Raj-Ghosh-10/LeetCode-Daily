defmodule Solution do
  @spec min_subarray(nums :: [integer], p :: integer) :: integer
  def min_subarray(nums, p) do
    total = Enum.sum(nums)
    need = rem(total, p)
    if need == 0, do: 0, else: do_min_subarray(nums, p, need)
  end

  defp do_min_subarray(nums, p, need) do
    map = %{0 => -1}
    {res, _prefix, _map} =
      Enum.reduce(Enum.with_index(nums), {length(nums), 0, map}, fn {x, i}, {res, prefix, map} ->
        prefix = rem(prefix + x, p)
        target = rem(prefix - need + p, p)
        res = if Map.has_key?(map, target), do: min(res, i - map[target]), else: res
        {res, prefix, Map.put(map, prefix, i)}
      end)

    if res == length(nums), do: -1, else: res
  end
end