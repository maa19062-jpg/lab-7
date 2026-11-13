% Base case: at the end of the list, create a one-element list.
add_at_the_end(X, [], [X]).

% Recursive case: keep the head and add X at the end of the tail.
add_at_the_end(X, [Head|Tail], [Head|Result]) :-
    add_at_the_end(X, Tail, Result).

% Example queries and expected results:
% ?- add_at_the_end(4, [1,2,3], R).
% R = [1,2,3,4].
% ?- add_at_the_end(d, [a,b,c], R).
% R = [a,b,c,d].
% ?- add_at_the_end(x, [], R).
% R = [x].
