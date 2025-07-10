-import(lists,[sum/1,sublist/2,split/2]).
-import(erlang,[display/1]).

sub_lists([],[]) -> [];
sub_lists(List1,List2) -> [Head1|Tail1] = List1, [Head2|Tail2] = List2,
[Head1-Head2] ++ sub_lists(Tail1,Tail2).

mrt2(_,[],_) -> 0;
mrt2(Prev,Inc,Dec) -> [IncH|IncT] = Inc, [DecH|DecT] = Dec,
Curr = Prev + IncH - DecH, max(Curr,mrt2(Curr,IncT,DecT)).

max_running_total(List,K) when length(List) =< K -> sum(List);
max_running_total(List,K) -> {Head,Tail} = split(K,List), Sum=sum(Head), 
max(Sum,mrt2(Sum,Tail,List)).

-spec max_free_time(EventTime :: integer(), K :: integer(), StartTime :: [integer()], EndTime :: [integer()]) -> integer().
max_free_time(EventTime, K, StartTime, EndTime) ->
 Starts = StartTime ++ [EventTime], Ends = [0] ++ EndTime,
  Gaps = sub_lists(Starts,Ends), max_running_total(Gaps,K+1). 