Definitions.

SYMBOLS=[{},\.]
WHITESPACE=[\s\t\r\n]+
STRING=[^{},\.\s]+
NUM=[0-9]+

Rules.

{STRING} : {token, {string, TokenLine, list_to_binary(TokenChars)}}.
{SYMBOLS} : {token, {list_to_atom(TokenChars), TokenLine}}.
{NUM} : {token, {int, TokenLine, list_to_integer(TokenChars)}}.
{WHITESPACE} : skip_token.

Erlang code.
