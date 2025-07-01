defmodule Solution do
  @spec possible_string_count(word :: String.t) :: integer
  def possible_string_count(word) do
    for <<ch::8 <- word>>, reduce: {nil, 1} do
      {prev_ch, res} ->
        if prev_ch == ch, do: {ch, res + 1}, else: {ch, res}
    end |> elem(1)
  end
end