defmodule Solution do
  @spec longest_subarray(nums :: [integer]) :: integer
  def longest_subarray(nums) do
    nums
    |> Stream.chunk_by(&Function.identity/1)
    |> Stream.map(&{hd(&1), length(&1)})
    |> Enum.max()
    |> elem(1)
  end
end