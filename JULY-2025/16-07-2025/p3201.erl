-spec maximum_length(Nums :: [integer()]) -> integer().
maximum_length(Nums) ->
    %% init C01 to 1, since we count from 2nd element flip (first is always the same)
    find_parity_flip(Nums, hd(Nums) rem 2, 1, 0, 0) .

%% truth table setup for parity and 
find_parity_flip([A | Nums], Parity, C01, C0, C1) -> 
    if
        Parity == 0 andalso A rem 2 == 0 -> find_parity_flip(Nums, A rem 2, C01  , C0+1, C1);
        Parity == 0 andalso A rem 2 == 1 -> find_parity_flip(Nums, A rem 2, C01+1, C0  , C1+1);
        Parity == 1 andalso A rem 2 == 0 -> find_parity_flip(Nums, A rem 2, C01+1, C0+1, C1);
        Parity == 1 andalso A rem 2 == 1 -> find_parity_flip(Nums, A rem 2, C01  , C0  , C1+1);
        true -> err
    end;
find_parity_flip([], Parity, C01, C0, C1) -> lists:max([C01, C0, C1]).