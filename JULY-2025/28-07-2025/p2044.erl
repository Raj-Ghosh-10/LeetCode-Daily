-spec count_max_or_subsets(Nums :: [integer()]) -> integer().

subarr([], Bor) -> [Bor];
subarr([H | T], Bor) ->
    subarr(T, Bor bor H) ++
    subarr(T, Bor).

count_max_or_subsets(Nums) ->
    Max = lists:foldl(
        fun(X, Res) ->
            Res bor X
        end, 0, Nums
    ),
    length([X || X <- subarr(Nums, 0), X == Max]).