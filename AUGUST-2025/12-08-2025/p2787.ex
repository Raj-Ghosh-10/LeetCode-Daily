defmodule Solution do
  @m 1_000_000_007

  @spec number_of_ways(n :: integer, x :: integer) :: integer
  def number_of_ways(n, x) do
    Task.async(fn ->
      1..n
      |> Stream.map(&(&1 ** x))
      |> Enum.take_while(& &1 <= n)
      |> subset_sum(n)
    end)
    |> Task.await()
  end

  @spec subset_sum([num], target) :: non_neg_integer()
        when num: pos_integer(),
             target: pos_integer()

  defp subset_sum([], _target) do
    0
  end

  defp subset_sum([target | _], target) do
    1
  end

  defp subset_sum([_], _target) do
    0
  end

  defp subset_sum([h | _], target) when h > target do
    0
  end

  defp subset_sum([h | t], target) do
    memoized({target, h}, fn ->
      rem(subset_sum(t, target - h) + subset_sum(t, target), @m)
    end)
  end

  defp memoized(key, fun) do
    with nil <- Process.get(key) do
      fun.() |> tap(&Process.put(key, &1))
    end
  end
end