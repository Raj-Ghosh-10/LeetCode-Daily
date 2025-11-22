defmodule Solution do
  @spec minimum_operations(nums :: [integer]) :: integer
  def minimum_operations(nums) do
    Enum.count(nums, fn x -> rem(x, 3) != 0 end)
  end
end