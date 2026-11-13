% Intended input: a ground element and a ground, finite list.
% The empty list stays empty.
deleteElement(_, [], []).

% Matching head: remove it and continue (including consecutive matches).
deleteElement(X, [X|Tail], Result) :-
    deleteElement(X, Tail, Result).

% Different head: keep it and process the remaining elements.
deleteElement(X, [Head|Tail], [Head|Result]) :-
    X \= Head,
    deleteElement(X, Tail, Result).

% Example queries and expected results:
% ?- deleteElement(1, [1,2,1,3,1], R).
% R = [2,3].
% ?- deleteElement(3, [1,2,3,4], R).
% R = [1,2,4].
% ?- deleteElement(a, [a,b,a,c], R).
% R = [b,c].
% ?- deleteElement(9, [1,2,3], R).
% R = [1,2,3].
% ?- deleteElement(1, [], R).
% R = [].
