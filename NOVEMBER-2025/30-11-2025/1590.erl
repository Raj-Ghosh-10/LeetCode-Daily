-spec min_subarray(Nums :: [integer()], P :: integer()) -> integer().
min_subarray(Nums, P) ->
    Total = lists:sum(Nums),
    Need = Total rem P,
    case Need of
        0 -> 0;
        _ -> do_min_subarray(Nums, P, Need)
    end.

do_min_subarray(Nums, P, Need) ->
    Map0 = #{0 => -1},
    {Res, _, _} =
        lists:foldl(
          fun({X, I}, {Res, Prefix, Map}) ->
              Prefix1 = (Prefix + X) rem P,
              Target = (Prefix1 - Need + P) rem P,
              Res1 = case maps:get(Target, Map, undefined) of
                         undefined -> Res;
                         Idx -> min(Res, I - Idx)
                     end,
              {Res1, Prefix1, maps:put(Prefix1, I, Map)}
          end,
          {length(Nums), 0, Map0},
          lists:zip(Nums, lists:seq(0, length(Nums) - 1))
        ),
    if Res == length(Nums) -> -1;
       true -> Res
    end.