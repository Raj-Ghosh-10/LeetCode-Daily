defmodule Solution do
  @spec largest_good_integer(num :: String.t) :: String.t
  def largest_good_integer(num) do
    ~r/(?<triplet>(.)\2\2)\2*/
    |> Regex.scan(num, capture: [:triplet])
    |> Enum.max(fn -> [""] end)
    |> hd()
  end
end