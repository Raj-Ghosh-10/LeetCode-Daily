remove_subfolders(Sorted) ->
    Result = filter_folders(lists:sort(Sorted), <<>>, []),
    lists:reverse(Result).

filter_folders([], _Last, Acc) ->
    Acc;
filter_folders([H | T], Last, Acc) ->
    case is_subfolder(Last, H) of
        true -> filter_folders(T, Last, Acc);
        false -> filter_folders(T, H, [H | Acc])
    end.

is_subfolder(<<>>, _) ->
    false;
is_subfolder(Prefix, Path) ->
    PrefixLen = byte_size(Prefix),
    PathLen = byte_size(Path),
    if
        PathLen =< PrefixLen -> false;
        true ->
            case binary:part(Path, 0, PrefixLen) of
                Prefix ->
                    case binary:at(Path, PrefixLen) of
                        $/ -> true;
                        _ -> false
                    end;
                _ -> false
            end
    end.