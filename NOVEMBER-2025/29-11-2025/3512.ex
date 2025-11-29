defmodule Solution do
  @spec min_operations(nums :: [integer], k :: integer) :: integer
  def min_operations(nums, k) do
    Enum.sum(nums) |> rem(k)
  end
end