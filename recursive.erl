-module(recursive).
-export([duplicate/2]).
-export([tail_duplicate/2]).
-export([fac/1]).
-export([len/1]).
-export([lenient_zip/2]).
-export([tail_fac/1]).
-export([tail_len/1]).
-export([tail_lenient_zip/2]).
-export([tail_reverse/1]).
-export([tail_zip/2]).
-export([zip/2]).

duplicate(0, _) -> [];
duplicate(N, Term) when N > 0 -> [Term|duplicate(N-1, Term)].

tail_duplicate(N, Term) -> tail_duplicate(N, Term, []).
 
tail_duplicate(0, _,    List) -> List;
tail_duplicate(N, Term, List) when N > 0 -> tail_duplicate(N-1, Term, [Term|List]).

fac(0) -> 1;
fac(N) when N > 0 -> N*fac(N-1).


len([]) -> 0;
len([_|T]) -> 1 + len(T).


%% reverses a list (a truly descriptive function name!)
reverse([]) -> [];
reverse([H|T]) -> reverse(T)++[H].

tail_reverse(L) -> tail_reverse(L, []).
 
tail_reverse([], Acc) -> Acc;
tail_reverse([H|T], Acc) -> tail_reverse(T, [H|Acc]).


%% This is how erlang does default arguments.
tail_fac(N) -> tail_fac(N, 1).
 
tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) when N > 0 -> tail_fac(N-1, N*Acc).


tail_len(L) -> tail_len(L, 0).
 
tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T, Acc + 1).


zip([], []) -> [];
zip([X|Xs], [Y|Ys]) -> [{X,Y}|zip(Xs,Ys)].

%% Tail call ZIP - My first function
tail_zip(X, Y) -> reverse(tail_zip(X, Y, [])).

tail_zip([], [], Acc) -> Acc;
tail_zip([X|Xs], [Y|Ys], Acc) -> tail_zip(Xs, Ys, [{X, Y}|Acc]).


lenient_zip([], _) -> [];
lenient_zip(_, []) -> [];
lenient_zip([X|Xs], [Y|Ys]) -> [{X,Y}|lenient_zip(Xs, Ys)].

tail_lenient_zip(X, Y) -> reverse(tail_lenient_zip(X, Y, [])).

tail_lenient_zip([], _, Acc) -> Acc;
tail_lenient_zip(_, [], Acc) -> Acc;
tail_lenient_zip([X|Xs], [Y|Ys], Acc) -> tail_lenient_zip(Xs, Ys, [{X,Y}|Acc]).
