defmodule Solution do
  @spec count_hill_valley(nums :: [integer]) :: integer
  def count_hill_valley([h | t]), do: helper(t, h, 0)
    
  @spec helper([integer], left :: integer, acc :: integer) :: integer
  defp helper([x | [x | _] = t], left, acc), do: helper(t, left, acc)
  defp helper([x | [nx | _] = t], left, acc) do 
    acc = if (x > left and x > nx) or (x < left and x < nx), do: acc + 1, else: acc
    helper(t, x, acc)
  end
  defp helper(_, _, acc), do: acc  
end