-module(p2).
-export([solve/0]).

solve() ->
    solve(4000000).

solve(Max) -> solve(1, 2, Max, 0).

solve(_, B, Max, Sum) when B >= Max -> Sum;
solve(A, B, Max, Sum) when B rem 2 == 0 ->
    solve(B, A + B, Max, Sum + B);
solve(A, B, Max, Sum) ->
    solve(B, A + B, Max, Sum).

