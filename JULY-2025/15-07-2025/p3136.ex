defmodule Solution do
  @spec is_valid(word :: String.t) :: boolean
  def is_valid(word) do
    chars = String.to_charlist(word)

    String.length(word) >= 3 and
        Enum.all?(chars,
            fn char -> (char in ?0..?9) or is_letter(char) end)
            and
            Enum.any?(chars, &is_vowel/1) and
            Enum.any?(chars, &(is_letter(&1) and not is_vowel(&1)))
  end

  def is_letter(char) do
    char in ?a..?z or char in ?A..?Z
  end

  def is_vowel(char) do
    char in [?a,?e,?i,?o,?u,?A,?E,?I,?O,?U]
  end
end