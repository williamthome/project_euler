-module(main).
-export([run/0]).

% Answer:  233168
% Completed on Fri, 15 Oct 2021, 17:41
% https://projecteuler.net/problem=1

run() ->
  run([3,5], 1000).

run(Multiples, Max) ->
  rem_sum(1, Multiples, Max, 0).

rem_sum(Value, Multiples, Max, Acc)
  when Value < Max ->
    rem_sum(Value + 1, Multiples, Max, Acc + rem_value(Value, Multiples));

rem_sum(_Value, _Max, _Multiples, Acc) ->
  Acc.

rem_value(Value, Multiples) ->
  case is_rem(Value, Multiples) of
    true -> Value;
    false -> 0
  end.

is_rem(Value, Multiples) ->
  lists:any(fun(Multiple) -> Value rem Multiple == 0 end, Multiples).
