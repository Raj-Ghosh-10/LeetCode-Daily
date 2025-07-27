-spec count_hill_valley(Nums :: [integer()]) -> integer().
count_hill_valley([H | Nums]) ->
    track_dir(Nums, hd(Nums) - H, 0).

%% Dir < 0 => up, Dir > 0 => down, Dir == 0 => same, need to recalculate when possible
track_dir([Current, Next | Nums], Dir, Count) -> 
    if 
        Dir > 0 andalso Next-Current < 0 -> track_dir([Next | Nums], Next-Current, Count+1);    %% peak found
        Dir < 0 andalso Next-Current > 0 -> track_dir([Next | Nums], Next-Current, Count+1);    %% valley found
        Dir == 0 ->                         track_dir([Next | Nums], Next-Current, Count);  %% need to recalculate the dir
        Next-Current == 0 ->                track_dir([Next | Nums], Dir, Count);   %% keep dir and continue tracking
        true ->                             track_dir([Next | Nums], Dir, Count)    %% continue climbing / descending
    end;
%% finished scan
track_dir([Current], Dir, Count) -> Count.