defmodule Solution do
  @spec prefixes_div_by5(nums :: [integer]) :: [boolean]
  def prefixes_div_by5(nums) do
    {result, _final_acc} =
      Enum.map_reduce(nums, 0, fn bit, mod ->
        new_mod = rem(mod * 2 + bit, 5)
        {new_mod == 0, new_mod}
      end)

    result
  end
end