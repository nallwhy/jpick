Terminals '{' '}' ',' '.' string int.
Nonterminals value array array_elements path path_elements elem.
Rootsymbol value.

value ->
    path : '$1'.
value ->
    array : ['$1'].
path ->
    path_elements : '$1'.
path_elements ->
    elem '.' value : ['$1' | '$3'].
path_elements ->
    elem : ['$1'].
array ->
    '{' array_elements '}' : '$2'.
array ->
    '{' '}' : [].
array_elements ->
    elem ',' value : ['$1' | '$3'].
array_elements ->
    elem : ['$1'].
elem ->
    string : extract_value('$1').
elem ->
    int : extract_value('$1').

Erlang code.

extract_value({_, _, Value}) ->
    Value.