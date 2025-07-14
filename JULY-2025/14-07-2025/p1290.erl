%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

gdv(L,N) ->
    case L#list_node.next == null of
        true -> N + L#list_node.val;
        false -> gdv(L#list_node.next, 
            (N + L#list_node.val) bsl 1)
    end
.

-spec get_decimal_value(Head :: #list_node{} | null) -> integer().
get_decimal_value(Head) ->
    gdv(Head,0)
.