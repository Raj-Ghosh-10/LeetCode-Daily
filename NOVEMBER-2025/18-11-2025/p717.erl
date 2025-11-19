-spec is_one_bit_character(Bits :: [integer()]) -> boolean().
is_one_bit_character(Bits) ->
    is_one_bit_character(Bits, 0, length(Bits)).

is_one_bit_character(Bits, I, N) when I < N - 1 ->
    case lists:nth(I + 1, Bits) of
        1 -> is_one_bit_character(Bits, I + 2, N);
        0 -> is_one_bit_character(Bits, I + 1, N)
    end;
is_one_bit_character(_Bits, I, N) ->
    I =:= N - 1.