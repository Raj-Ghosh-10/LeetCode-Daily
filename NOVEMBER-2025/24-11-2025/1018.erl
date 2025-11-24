-spec prefixes_div_by5(Nums :: [integer()]) -> [boolean()].
prefixes_div_by5(Nums) ->
    lists:reverse(prefixes_div_by5(Nums, 0, [])).

prefixes_div_by5([], _Mod, Acc) ->
    Acc;
prefixes_div_by5([Bit | Rest], Mod, Acc) ->
    NewMod = (Mod * 2 + Bit) rem 5,
    prefixes_div_by5(Rest, NewMod, [NewMod =:= 0 | Acc]).