-module(p3).
-import(math,[sqrt/1]).
-import(lists, [last/1]).
-export([solve/0, isPrime/1, primeFactors/1, nextPrimeAfter/1]).

solve() ->
    solve(600851475143).

solve(N) ->
    last(primeFactors(N)).

primeFactors(N) ->
    case isPrime(N) of
        true -> [N];
        false -> 
            {L, R} = findPrimeFactor(N),
            primeFactors(L) ++ primeFactors(R)
    end.

isPrime(N) when N =< 3 -> N > 1;
isPrime(N) when N rem 2 == 0 ; N rem 3 == 0 -> false;
isPrime(N) -> isPrime(N, 5, ceiling(sqrt(N))).

isPrime(_, T, Max) when T > Max -> true;
isPrime(N, T, _) when N rem T == 0 ; N rem (T + 2) == 0 -> false;
isPrime(N, T, Max) -> isPrime(N, T+6, Max).

findPrimeFactor(N) -> findPrimeFactor(N, 2).

findPrimeFactor(N, F) when N rem F == 0 -> {F, N div F};
findPrimeFactor(N, F) ->
    Next = nextPrimeAfter(F),
    findPrimeFactor(N, Next).

nextPrimeAfter(N) -> 
    case isPrime(N + 1) of
        true -> N + 1;
        false -> nextPrimeAfter(N + 1)
    end.

ceiling(X) when X < 0 ->
    trunc(X);
ceiling(X) ->
    T = trunc(X),
    case X - T == 0 of
        true -> T;
        false -> T + 1
    end.
