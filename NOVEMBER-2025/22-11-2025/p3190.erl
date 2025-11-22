-spec minimum_operations(Nums :: [integer()]) -> integer().
minimum_operations(Nums) ->
    lists:foldl(fun(X, Acc) ->
        Acc + case X rem 3 of 0 -> 0; _ -> 1 end
    end, 0, Nums).