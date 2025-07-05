find_lucky(Arr) ->
    Counting_array = count_instances(Arr, #{}),
    Luckies = [Num || {Num, Count} <- Counting_array, Num == Count],
    if Luckies == [] -> -1;
        true -> lists:max(Luckies)
    end.

count_instances([], Ret) -> maps:to_list(Ret);
count_instances([A | Arr], Ret) ->
    Counter = maps:get(A, Ret, 0),
    count_instances(Arr, maps:put(A, Counter+1, Ret)).