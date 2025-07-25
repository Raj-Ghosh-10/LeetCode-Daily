-spec max_sum(Nums :: [integer()]) -> integer().
max_sum(Nums) ->
    Uniq_sorted = lists:usort(Nums),    %% sort and keep uniques only
    Max = lists:max(Uniq_sorted),   
    if Max < 1 -> Max;                  %% if max is non-positive, just return it
        true -> lists:sum([Num || Num <- Uniq_sorted, Num > 0])
    end.