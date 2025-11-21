defmodule Solution do
  @spec count_palindromic_subsequence(s :: String.t) :: integer
  def count_palindromic_subsequence(s) do
    positions =
      s
      |> :binary.bin_to_list()
      |> Stream.with_index()
      |> Enum.reduce(%{}, fn {char, i}, acc ->
        Map.update(acc, char, {i, i, [i]}, fn {first, _last, indices} ->
          {first, i, [i | indices]}
        end)
      end)

    for {_, {first, last, [_, _ | _]}} <- positions, reduce: 0 do
      acc ->
        Enum.count(positions, fn {_, {_, _, indices}} ->
          Enum.any?(indices, & &1 > first and &1 < last)
        end) + acc
    end
  end
end