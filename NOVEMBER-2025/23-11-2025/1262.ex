defmodule Solution do
  @spec max_sum_div_three(nums :: [integer]) :: integer
  def max_sum_div_three(nums) do
    {sum, m1, m2} =
      Enum.reduce(nums, {0, [], []}, fn x, {sum, m1, m2} ->
        sum = sum + x
        case rem(x, 3) do
          1 ->
            m1 = [x | m1] |> Enum.sort() |> Enum.take(2)
            {sum, m1, m2}
          2 ->
            m2 = [x | m2] |> Enum.sort() |> Enum.take(2)
            {sum, m1, m2}
          _ ->
            {sum, m1, m2}
        end
      end)

    case rem(sum, 3) do
      0 -> sum
      1 ->
        remove1 = Enum.at(m1, 0, :infinity)
        remove2 = if length(m2) == 2, do: Enum.sum(m2), else: :infinity
        sum - min(remove1, remove2)
      2 ->
        remove1 = Enum.at(m2, 0, :infinity)
        remove2 = if length(m1) == 2, do: Enum.sum(m1), else: :infinity
        sum - min(remove1, remove2)
    end
  end
end