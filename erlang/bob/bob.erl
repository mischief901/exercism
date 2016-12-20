-module(bob).

-export([response_for/1, is_question/1, is_shouting/1, is_silence/1]).

response_for(String) ->
    Response = 
        case is_shouting(String) of 
            true -> "Whoa, chill out!";
            _ -> case is_question(String) of
                true -> "Sure.";
                _ -> case is_silence(String) of
                    true -> "Fine. Be that way!";
                    _ -> "Whatever."
                end
            end
        end,
    Response.

is_question([]) -> false;
is_question(Question) -> lists:last(Question) =:= $?.

is_shouting([]) -> false;
is_shouting(Shout) -> 
    case {re:run(Shout, "[A-Z+]"), re:run(Shout, "[a-z]")} of
        {{match, _}, nomatch} -> true;
        _ -> false
    end.


is_silence([]) -> true;
is_silence([H|T]) when H == 32 -> is_silence(T);
is_silence(_) -> false. 