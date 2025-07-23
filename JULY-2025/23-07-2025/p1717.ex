defmodule Solution do
  def maximum_gain(s, x, y) do
    {p1a, p1b, v1, p2a, p2b, v2} =
      if x >= y do
        {"a", "b", x, "b", "a", y}
      else
        {"b", "a", y, "a", "b", x}
      end

    {remaining, points1} = remove_pairs(String.graphemes(s), p1a, p1b, v1)
    {_, points2} = remove_pairs(remaining, p2a, p2b, v2)

    points1 + points2
  end

  defp remove_pairs(chars, a, b, value) do
    Enum.reduce(chars, {[], 0}, fn ch, {stack, score} ->
      case stack do
        [^a | rest] when ch == b -> {rest, score + value}
        _ -> {[ch | stack], score}
      end
    end)
    |> then(fn {stack, score} -> {Enum.reverse(stack), score} end)
  end
end