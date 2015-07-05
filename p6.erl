-module(p6).
-export([solve/0]).

solve() ->
    solve(100).

solve(N) -> sumSeriesSquared(N) - sumSquaredSeries(N).    


sumSquaredSeries(N) -> sumSquaredSeries(N, 1, 0).

sumSquaredSeries(N, I, S) when N < I -> S;
sumSquaredSeries(N, I, S) -> sumSquaredSeries(N, I + 1, S + (I * I)).

sumSeriesSquared(N) -> 
    S = sumSeries(N, 1, 0),
    S * S.

sumSeries(N, I, S) when N < I -> S;
sumSeries(N, I, S) -> sumSeries(N, I + 1, S + I).
