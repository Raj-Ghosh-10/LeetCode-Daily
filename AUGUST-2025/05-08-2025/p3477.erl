-spec num_of_unplaced_fruits(Fruits :: [integer()], Baskets :: [integer()]) -> integer().
num_of_unplaced_fruits(Fruits, Baskets) ->
    fill_basket(Fruits, Baskets, 0).

fill_basket([], Baskets, Counter) -> Counter;
fill_basket([F | Fruits], Baskets, Counter) ->
    {Found_basket, Used_B} = can_fit(F, Baskets),
    if Found_basket ->  fill_basket(Fruits, lists:delete(Used_B, Baskets), Counter);
        true ->         fill_basket(Fruits, Baskets, Counter+1)
    end.
    
can_fit(F, [B | Baskets]) when B >= F -> {true, B}; %% remove basket B from availables
can_fit(F, [B | Baskets]) -> can_fit(F, Baskets);
can_fit(F, []) -> {false, non}.