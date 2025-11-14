-module(calc).
-export([rpn/1]).
-export([sum/1]).
 
read(N) ->
  case string:to_float(N) of
    {error,no_float} -> list_to_integer(N);
    {F,_} -> F
  end.
 
rpn(L) when is_list(L) ->
  [Res] = lists:foldl(fun rpn/2, [], string:tokens(L, " ")),
  Res.
  
rpn("+", [N1, N2 | S]) -> [N2 + N1 | S];
rpn("-", [N1, N2 | S]) -> [N2 - N1 | S];
rpn("*", [N1,N2|S])    -> [N2*N1|S];
rpn("/", [N1,N2|S])    -> [N2/N1|S];
rpn("^", [N1,N2|S])    -> [math:pow(N2,N1)|S];
rpn("ln", [N|S])       -> [math:log(N)|S];
rpn("log10", [N|S])    -> [math:log10(N)|S];
rpn("sum", S)          -> [sum(S)];   %% Didn't realize this was available in lists:

rpn(X, Stack) -> [read(X)|Stack].


sum(X) -> sum(X, 0).
sum([], Acc) -> Acc;
sum([X|Y], Acc) -> sum(Y, Acc + X).