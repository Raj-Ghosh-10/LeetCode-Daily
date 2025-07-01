defmodule Solution do
  def find_lhs(nums) do
    counts = Enum.frequencies(nums)

    Enum.reduce(counts, 0, fn {num, count}, max_length ->
      if Map.has_key?(counts, num + 1) do
        max(max_length, count + Map.fetch!(counts, num + 1))
      else
        max_length
      end
    end)
  end
end