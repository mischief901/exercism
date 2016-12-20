-module(accumulate).

-export([accumulate/2]).

accumulate(_Fun, []) -> [];
accumulate(Fun, [Head|Tail]) -> [Fun(Head) | accumulate(Fun, Tail)].