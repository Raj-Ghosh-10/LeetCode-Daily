-spec count_palindromic_subsequence(S :: unicode:unicode_binary()) -> integer().
count_palindromic_subsequence(S) ->
    Bytes = binary:bin_to_list(S),

    First = lists:duplicate(26, -1),
    Last  = lists:duplicate(26, -1),

    {First1, Last1} =
        lists:foldl(
          fun({Ch, I}, {F, L}) ->
                  C = Ch - $a,
                  F1 = case lists:nth(C+1, F) of
                           -1 -> update_nth(C+1, I, F);
                           _  -> F
                       end,
                  L1 = update_nth(C+1, I, L),
                  {F1, L1}
          end,
          {First, Last},
          lists:zip(Bytes, lists:seq(0, length(Bytes)-1))
        ),

    lists:foldl(
      fun(C, Acc) ->
              Fc = lists:nth(C+1, First1),
              Lc = lists:nth(C+1, Last1),
              case Fc =/= -1 andalso Lc - Fc > 1 of
                  true ->
                      Middle = lists:sublist(Bytes, Fc+2, Lc - Fc - 1),
                      Mask = lists:foldl(
                               fun(Mid, M) ->
                                       M bor (1 bsl (Mid - $a))
                               end, 0, Middle),
                      Acc + popcount(Mask);
                  false ->
                      Acc
              end
      end,
      0,
      lists:seq(0, 25)
    ).

update_nth(N, Val, List) ->
    lists:sublist(List, N-1)
    ++ [Val]
    ++ lists:nthtail(N, List).

popcount(0) -> 0;
popcount(X) -> (X band 1) + popcount(X bsr 1).