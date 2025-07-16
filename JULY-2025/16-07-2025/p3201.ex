defmodule Solution do
  import Bitwise, only: [
    band: 2,  # bitwise and
    bxor: 2,  # bitwise xor
    bnot: 1   # bitwise not
  ]

  @spec maximum_length(nums :: [integer()]) :: non_neg_integer()
  def maximum_length([h | _t] = nums) do
    do_max_length(nums, bnot(h), 0, 0, 0)
  end

  @spec do_max_length(
    nums :: [integer()],
    prev :: integer(),
    length_acc :: non_neg_integer(),
    odds_acc :: non_neg_integer(),
    alters_acc :: non_neg_integer()
  ) :: non_neg_integer()
  defp do_max_length([h | t], prev, length, odds, alters) do
    do_max_length(t, h, length + 1, odds + band(h, 1), alters + band(1, bxor(h, prev)))
  end

  defp do_max_length([], _, length, odds, alters) do
    odds
    |> max(length - odds)
    |> max(alters)
  end
end