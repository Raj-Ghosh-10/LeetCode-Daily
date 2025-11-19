defmodule Solution do
  @spec is_one_bit_character(bits :: [integer]) :: boolean
  def is_one_bit_character([1, _ | tl]) do
    if tl == [], do: false, else: is_one_bit_character(tl)
  end
  def is_one_bit_character([0 | tl]), do: tl == [] || is_one_bit_character(tl)
end