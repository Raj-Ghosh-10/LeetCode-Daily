-import(lists,[max/1,split/2,min/1,delete/2]).
-import(erlang,[display/1]).

% subtract List2 from List1 per element.
sub_lists([],[]) -> [];
sub_lists(List1,List2) -> [Head1|Tail1] = List1, [Head2|Tail2] = List2,
[Head1-Head2] ++ sub_lists(Tail1,Tail2).

% top3 runner function
top3(Head,[],_) -> Head; 
top3(Head,Tail,Min) ->
    [H|T] = Tail,
    case H > Min of % check if we need to swap H into the list
        false -> top3(Head,T,Min);
        true -> NewHead = [H]++delete(Min,Head), top3(NewHead,T,min(NewHead))
    end
.

% top3 initialise function
top3(List) when length(List) =< 3 -> List;
top3(List) ->
    {Head,Tail} = split(3,List), % use the first 3 elements as the initial top 3
    top3(Head,Tail,min(Head))
.

% reorder runner function
reorder(_,[],[],_) -> 0;
reorder(Gaps1,Gaps2,Durations,Top3Gaps) ->
%display({Gaps1,Gaps2,Durations,Top3Gaps}),
    [G1|GT1] = Gaps1,
    [G2|GT2] = Gaps2,
    [D|DT] = Durations,
    % We remove our 2 gaps from the top 3 (if present, and take the max.
    % If there's a gap large enough to take it, add its duration to the return value.
    case D =< max(delete(G1,delete(G2,Top3Gaps))) of
        false -> max(G1 + G2, reorder(GT1,GT2,DT,Top3Gaps));
        true -> max(G1 + G2 + D, reorder(GT1,GT2,DT,Top3Gaps))
    end
.

% reorder initialise function
reorder(Gaps,Durations) ->
    Top3Gaps = top3(Gaps),
    [_|Gaps2] = Gaps,
    reorder(Gaps,Gaps2,Durations,Top3Gaps)
.

-spec max_free_time(EventTime :: integer(), StartTime :: [integer()], EndTime :: [integer()]) -> integer().
max_free_time(EventTime, StartTime, EndTime) ->
   Starts = StartTime ++ [EventTime], Ends = [0] ++ EndTime,
  Gaps = sub_lists(Starts,Ends), Durations = sub_lists(EndTime,StartTime),
  reorder(Gaps,Durations) 
.