defmodule Solution do
  @spec intersection_size_two(intervals :: [[integer]]) :: integer
  def intersection_size_two(intervals) do
    intervals =
      Enum.sort(intervals, fn [_, e1], [_, e2] ->
        e1 <= e2
      end)

    [start0, end0] = hd(intervals)
    prev1 = end0 - 1
    prev2 = end0
    count = 2

    {_, _, result} =
      intervals
      |> Enum.drop(1)
      |> Enum.reduce({prev1, prev2, count}, fn [start, endi], {p1, p2, c} ->
        cond do
          p2 < start ->
            {endi - 1, endi, c + 2}

          p1 < start ->
            new_p1 =
              if endi == p2 do
                endi - 1
              else
                endi
              end
            {p1_new, p2_new} =
              if new_p1 > p2 do
                {p2, new_p1}
              else
                {new_p1, p2}
              end

            {p1_new, p2_new, c + 1}
          true ->
            {p1, p2, c}
        end
      end)

    result
  end
end