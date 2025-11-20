-spec intersection_size_two([[integer()]]) -> integer().
intersection_size_two(Intervals) ->
    Sorted = lists:sort(
        fun([_, E1], [_, E2]) -> E1 =< E2 end,
        Intervals
    ),

    [Start0, End0] = hd(Sorted),
    Prev1 = End0 - 1,
    Prev2 = End0,
    Count0 = 2,

    {_, _, FinalCount} =
        lists:foldl(
            fun([Start, End], {P1, P2, C}) ->
                if
                    P2 < Start ->
                        {End - 1, End, C + 2};

                    P1 < Start ->
                        NewP1 =
                            case End =:= P2 of
                                true  -> End - 1;
                                false -> End
                            end,

                        {FinalP1, FinalP2} =
                            case NewP1 > P2 of
                                true  -> {P2, NewP1};
                                false -> {NewP1, P2}
                            end,

                        {FinalP1, FinalP2, C + 1};

                    true ->
                        {P1, P2, C}
                end
            end,
            {Prev1, Prev2, Count0},
            tl(Sorted)
        ),

    FinalCount.