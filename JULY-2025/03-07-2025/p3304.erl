-spec kth_character(K :: integer()) -> char().
kth_character(K) ->
    Count = count_logs(K, 0),
    Cycles = Count rem 26,
    $a + Cycles
  .

count_logs(1, Count) -> Count;
count_logs(K, Count) ->
    Cycles = floor(math:log2(K)),
    Rem = K - floor(math:pow(2, Cycles)),
    if Rem == 0 -> Count + Cycles;
        true -> count_logs(Rem, Count+1)
    end.