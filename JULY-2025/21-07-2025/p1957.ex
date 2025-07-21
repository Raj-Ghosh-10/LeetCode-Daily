defmodule Solution do
@spec make_fancy_string(s :: String.t) :: String.t
def make_fancy_string(<<char, rest::bits>> = str) when byte_size(str) > 0 do
  process_bits(rest, char, 1, <<char>>)
end
def make_fancy_string(""), do: ""

defp process_bits(<<char, rest::bits>>, char, 2, acc) do
  process_bits(rest, char, 2, acc)
end
defp process_bits(<<char, rest::bits>>, char, count, acc) do
  process_bits(rest, char, count + 1, <<acc::bits, char>>)
end
defp process_bits(<<char, rest::bits>>, _prev, _count, acc) do
  process_bits(rest, char, 1, <<acc::bits, char>>)
end
defp process_bits(<<>>, _prev, _count, acc), do: acc
end