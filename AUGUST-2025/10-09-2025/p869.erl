-spec reordered_power_of2(N :: integer()) -> boolean().
reordered_power_of2(N) ->
    compare_powers(N, 0).

compare_powers(Num, 31) -> false;       %% no match 
compare_powers(Num, Exp) -> 
    Pow = floor(math:pow(2, Exp)),
    Len1 = length(integer_to_list(Num)),
    Len2 = length(integer_to_list(Pow)),
    if 
        Len1 == Len2 ->     %% possible match
            Found = compare_digits(integer_to_list(Num), integer_to_list(Pow)),
            if Found -> true;
                true -> compare_powers(Num, Exp+1)
            end;
        Len2 > Len1 -> false;%% not possible to match
        true -> compare_powers(Num, Exp+1)
    end.

compare_digits([], []) -> true;     %% both scans finished
compare_digits(Num, [D | Pow]) ->
    Removed = lists:delete(D, Num),
    %% if num is same after delete, missing digit
    if Removed == Num -> false;
        true -> compare_digits(Removed, Pow)
    end.