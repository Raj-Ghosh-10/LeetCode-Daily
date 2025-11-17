-spec k_length_apart(Nums :: [integer()], K :: integer()) -> boolean().
k_length_apart(Nums, K) ->
    k_length_apart(Nums, K, -1, 0).

k_length_apart([], _K, _Prev, _I) ->
    true;

k_length_apart([1 | Rest], K, Prev, I) ->
    case (Prev /= -1) andalso ((I - Prev - 1) < K) of
        true -> false;
        false -> k_length_apart(Rest, K, I, I + 1)
    end;

k_length_apart([_ | Rest], K, Prev, I) ->
    k_length_apart(Rest, K, Prev, I + 1).