defmodule Solution do
  @large 1_000_000_007

  @spec num_subseq(nums :: [integer], target :: integer) :: integer
  def num_subseq(nums, target) do
    Enum.sort(nums)
    |> Enum.split_while(&(&1 <= target / 2))
    |> then(fn {left, right} ->
      List.foldr(left, {0, 1, right, target}, &do_fold/2)
    end)
    |> elem(0)
  end

  defp do_fold(lo, {ans, combi, [hi | right], target}) when lo + hi <= target do
    do_fold(lo, {ans, rem(combi * 2, @large), right, target})
  end
  defp do_fold(lo, {ans, combi, right, target}) do
    {rem(ans + combi, @large), rem(combi * 2, @large), right, target}
  end
end