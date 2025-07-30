-spec longest_subarray(Nums :: [integer()]) -> integer().
longest_subarray(Nums) ->
    longest_max(Nums, 0, 0, 0).

longest_max([], Max, Count, Max_Count) -> lists:max([Count, Max_Count]);
longest_max([H | Nums], Max, Count, Max_Count) -> 
    if
        H > Max -> longest_max(Nums, H, 1, 1);                      %% reset to count new streak of max
        H == Max -> longest_max(Nums, Max, Count+1, Max_Count);     %% add to count
        true -> longest_max(Nums, Max, 0, lists:max([Count, Max_Count]))    %% finished streak, store max streak
    end.