-module(p5).
-export([solve/0]).

solve() ->
    solve(20).

solve(Range) -> solve(Range, Range, Range).

solve(N, 1, _) -> N;
solve(N, Factor, Range) when N rem Factor == 0 -> solve(N, Factor - 1, Range);
solve(N, _, Range) -> solve(N + Range, Range, Range).
