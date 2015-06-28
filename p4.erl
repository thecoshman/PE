-module(p4).
-import(lists, [reverse/1, max/1]).
-export([solve/0, isPalandrome/1]).

solve() ->
    max(solve(999, 999, 100)).

solve(L, _, Min) when L < Min -> [];
solve(L, R, Min) when R < Min -> solve(L - 1, L - 1, Min);
solve(L, R, Min) ->
    P = L * R,
    case isPalandrome(P) of
        true -> [P] ++ solve(L, R-1, Min);
        false -> solve(L, R-1, Min)
    end.

isPalandrome(T) ->
    S = integer_to_list(T),
    isSame(S, reverse(S)).

isSame(T,T) -> true;
isSame(_,_) -> false.
