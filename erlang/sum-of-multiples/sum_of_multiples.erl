-module(sum_of_multiples).
-export([sequence/1, seqFilter/2]).


%sumOfMultiples([], _) -> [];
%sumOfMultiples([H|T], Num) ->   
%    multiples(H, Num) ++ sumOfMultiples(T, Num).

%multiples(Num1, Num2) when Num1 == Num2 ->
%    [Num1];
%multiples(Num1, Num2) ->
%    case Num2 rem Num1 of
%        0 -> [Num2 | multiples(Num1, Num2 - 1)];
%        _ -> multiples(Num1, Num2 - 1)
%    end.

sequence(Num) -> lists:seq(0, Num).

seqFilter(Num1, Nums) ->
    lists:filter(fun(Elem) ->
    case Elem rem Num1 of 
        0 -> true;
        _ -> false
        end
    end, Nums).

