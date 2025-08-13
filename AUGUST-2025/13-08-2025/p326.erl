-spec is_power_of_three(N :: integer()) -> boolean().
is_power_of_three(N) -> inner(N, 0).

-spec inner(N :: integer(), R :: integer()) -> boolean().
inner(_, R) when R =/= 0 -> false;
inner(N, 0) when N < 1 -> false;
inner(1, 0) -> true;
inner(N, _) -> inner(N div 3, N rem 3).