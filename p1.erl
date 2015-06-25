-module(p1).
-export([solve/0]).

solve() ->
    solve(1000).
   
solve(Max) -> solve(Max - 1, 0).

solve(0, Sum) -> Sum;
solve(Value, Sum) when Value rem 5 == 0 ; Value rem 3 == 0 -> 
    Value + solve(Value - 1, Sum);
solve(Value, Sum) -> 
    solve(Value - 1, Sum).
