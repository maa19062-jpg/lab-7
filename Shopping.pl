
shopping :-
    shopping_menu([icecream, juice, chocolate, pizza, chips]).

shopping_menu(Basket) :-
    nl,
    writeln('--- Shopping Menu ---'),
    writeln('d: Display all items'),
    writeln('a: Add an item'),
    writeln('e: Exit'),
    write('Your choice (end with a period): '),
    read(Choice),
    shopping_action(Choice, Basket).

shopping_action(Choice, Basket) :-
    ( Choice == d ->
        writeln('Your basket:'),
        display_items(Basket),
        shopping_menu(Basket)
    ; Choice == a ->
        write('Enter an item (end with a period): '),
        read(Item),
        ( Item == end_of_file ->
            writeln('Goodbye!')
        ; ground(Item) ->
            writeln('Item added.'),
            shopping_menu([Item|Basket])
        ; writeln('Please enter an item, not a variable.'),
          shopping_menu(Basket)
        )
    ; Choice == e ->
        writeln('Goodbye!')
    ; Choice == end_of_file ->
        writeln('Goodbye!')
    ; writeln('Invalid choice. Please enter d., a., or e.'),
      shopping_menu(Basket)
    ).

% Base case: stop when no items remain.
display_items([]).
% Recursive case: print the head, then display the tail.
display_items([Head|Tail]) :-
    writeln(Head),
    display_items(Tail).
