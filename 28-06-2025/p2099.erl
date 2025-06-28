max_subsequence(Numbers, K) ->
    Indexed = lists:zip(lists:seq(1, length(Numbers)), Numbers),
    TopK = take_top_k_by_value(Indexed, K),
    Sorted = lists:sort(fun({I1, _}, {I2, _}) -> I1 =< I2 end, TopK),
    [V || {_, V} <- Sorted].

take_top_k_by_value(List, K) ->
    SortedByValueDesc = lists:sort(fun({_, V1}, {_, V2}) -> V1 >= V2 end, List),
    lists:sublist(SortedByValueDesc, K).