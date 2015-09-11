-module(tut).
-export([add/2, dbl/1, hello/0]).
-author("Daryl Richter").
-vsn(1).

add(A, B) ->
A + B.

dbl(X) ->
  2 * X.

%% Shows greetings.
%% io:format/1 is the standard function used to output text.
hello() ->
  io:format("Hello, world!~n").
