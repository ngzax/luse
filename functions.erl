-module(functions).
-compile(export_all). %% replace with -export() later, for God's sake!

head([H|_]) -> H.

second([_,X|_]) -> X.

same(X,X) ->
  true;
same(_,_) ->
  false.

valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
  io:format("The Date tuple (~p) says today is: ~p/~p/~p,~n",[Date,Y,M,D]),
  io:format("The time tuple (~p) indicates: ~p:~p:~p.~n", [Time,H,Min,S]);

valid_time(_) ->
  io:format("Stop feeding me wrong data!~n").

%% The , below is andalso
right_age(X) when X >= 16, X =< 104 ->
  true;
right_age(_) ->
  false.

%% The ; below is orelse
wrong_age(X) when X < 16; X > 104 ->
true;
wrong_age(_) ->
false.

insert(X,[]) -> 
  [X];
insert(X,Set) ->
  case lists:member(X,Set) of
    true  -> Set;
    false -> [X|Set]
  end.
