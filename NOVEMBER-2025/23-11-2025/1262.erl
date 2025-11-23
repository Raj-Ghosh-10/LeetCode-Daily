-spec max_sum_div_three(Nums :: [integer()]) -> integer().
max_sum_div_three(Nums) ->
    Big = 1 bsl 60,
    {Sum, M1A, M1B, M2A, M2B} = lists:foldl(
        fun(X, {S, M1A, M1B, M2A, M2B}) ->
            R = X rem 3,
            S1 = S + X,
            case R of
                1 ->
                    case X < M1A of
                        true -> {S1, X, M1A, M2A, M2B};
                        false -> case X < M1B of
                                    true -> {S1, M1A, X, M2A, M2B};
                                    false -> {S1, M1A, M1B, M2A, M2B}
                                 end
                    end;
                2 ->
                    case X < M2A of
                        true -> {S1, M1A, M1B, X, M2A};
                        false -> case X < M2B of
                                    true -> {S1, M1A, M1B, M2A, X};
                                    false -> {S1, M1A, M1B, M2A, M2B}
                                 end
                    end;
                _ -> {S1, M1A, M1B, M2A, M2B}
            end
        end, {0, Big, Big, Big, Big}, Nums),
    Rem = Sum rem 3,
    case Rem of
        0 -> Sum;
        1 ->
            Opt1 = M1A,
            Opt2 = if M2B < Big -> M2A + M2B; true -> Big end,
            Remove = min(Opt1, Opt2),
            if Remove == Big -> 0; true -> Sum - Remove end;
        2 ->
            Opt1 = M2A,
            Opt2 = if M1B < Big -> M1A + M1B; true -> Big end,
            Remove = min(Opt1, Opt2),
            if Remove == Big -> 0; true -> Sum - Remove end
    end.